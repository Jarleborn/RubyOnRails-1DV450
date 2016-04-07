class Api::V1::SystembolagsController < Api::V1::BaseController
	before_action :offset_params, only: [:index]
	before_action :authenticate, only: [:create, :destroy, :update]
	before_action :key_access


	def show
		syst = Systembolag.find_by_id(params[:id])
		if syst.nil?
			render json: { errors: "Couldn't find the systembolag your looking for. Sure you wrote the right Id?" }, status: :not_found
		else
			respond_with :api, syst
		end
	end

#Cheks if ids is given if they are it shows the ones for that id, it no one is give it shows all
	def index
		if params[:tag_id].present?
			tag = Tag.find_by_id(params[:tag_id])
			syst = tag.systembolags unless tag.nil?
		elsif params[:adress].present?
			loc = Position.near(params[:address_city], 20)
			syst = []
			loc.each do |loc|
				syst.push(Systembolag.find_by_id(loc.systembolag_id))
			end

		elsif params[:lat] && params[:lon]
			loc = Position.near([params[:latitude], params[:longitude]], 50)
			syst = []
			loc.each do |loc|
				syst.push(Systembolag.find_by_id(loc.systembolag_id))
			end
		elsif params[:creator_id].present?
			creator = Creator.find_by_id(params[:creator_id])
			syst = creator.systembolags unless creator.nil?

		elsif params[:query].present?
			param = params[:query]
			syst = Systembolag.where("name LIKE ?", "%#{param}%")
		else
			syst = Systembolag.all.sort_by { |e| e[:name]}

		end

		if syst.present?
			syst = syst.drop(@offset)
			syst = syst.take(@limit)
			respond_with :api, syst, status: :ok

		else
			render json: { errors: "Couldn't find any systembolag." }, status: :not_found
		end


	end

	def create
		syst = Systembolag.new(systembolag_params.except(:tags, :positions))#Creates new systembolag witout tags and position
		syst.creator_id = current_user.id
		#If tags given it checks if them exists otherview it creates them
		if systembolag_params[:tags].present?
			tag_params = systembolag_params[:tags]

			tag_params.each do |tag|
				if Tag.find_by_name(tag["name"]).present?
					syst.tags << Tag.find_by_name(tag["name"])
				else
					syst.tags << Tag.create(tag)
				end
			end
		end

		if Systembolag.find_by_name(syst.name).present?
			render json: { errors: "This systembolag already exist in the database" }, status: :conflict
		else
			if syst.save
				#If Loccation given it checks if them exists if they don't it creates them
				if systembolag_params[:positions].present?
					systembolag_params[:positions].each do |loc|
						if Position.find_by_address(loc["adress"])
							render json: { errors: "This position is ocupied by antoher systembolag" }, status: :conflict
						else	
							Position.create(adress: pos["address"], systembolag_id: syst.id)
						end
					end
				end

				respond_with :api, syst, status: :created
			else
				render json: { errors: syst.errors.messages }, status: :bad_request
			end
		end

	end

#Delates a systembolag based on id given
	def destroy
		if syst = Systembolag.find_by_id(params[:id])
			syst.destroy
			render json: { action: "destroy", message: "The systembolag  is gone.", status: :ok}
		else
			render json: { errors: "Couldn't find systembolag. Allways give me a valid ID" }, status: :not_found
		end
	end

#updates systembolag based on id given
	def update
		if syst = Systembolag.find_by_id(params[:id])
			#If tag is given the old one is erased and the new one is added 
			if systembolag_params[:tags].present?
				tag_params = systembolag_params[:tags]
				syst.tags = []
				tag_params.each do |tag|
					if Tag.find_by_name(tag["name"]).present?
						syst.tags << Tag.find_by_name(tag["name"])
					else
						syst.tags << Tag.create(tag)
					end
				end
			end 

			if systembolag_params[:positions].present? #Checks if position is present
				syst.positions = [] #Deleats old position
				systembolag_params[:positions].each do |loc|
					if Position.find_by_address(loc["adress"]) #Checks if position exists
						render json: { errors: "This position is ocupied by antoher systembolag" }, status: :conflict #if it does you cant add it
					else
						Position.create(address: loc["address"], restaurant_id: syst.id) #if its not in the db it will be created
					end
				end
			end

			if syst.update(systembolag_params.except(:tags, :positions))
				systloc = syst.positions.as_json(only: [:id, :address, :latitude, :longitude])
				respond_with :api, syst do |format|
					format.json { render json: { action: "update", systembolag: {id: syst.id, name: syst.name, description: syst.description, positions: systloc} }, status: :created }
				end
			else
				render json: { errors: syst.errors.messages }, status: :bad_request
			end
		else
			render json: { errors: "Couldn't find restaurant. Sure you wrote the right Id?" }, status: :not_found
		end
	end


	def systembolag_params
		json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
		json_params.require(:systembolag).permit(:name, :description, tags: [:name], positions: [:adress])
	end

end



