class Api::V1::PositionsController < Api::V1::BaseController

	before_action :offset_params, only: [:index]
	before_action :key_access
	before_action :authenticate, only: [:create, :destroy, :update]


	def index

		if params[:systembolag_id].present?
			syse = Systembolag.find_by_id(params[:systembolag_id])
			pos = syse.positions unless syse.nil?
		else
			pos = Position.all
		end

		if pos.present?
			pos = pos.drop(@offset)
			pos = pos.take(@limit)
			respond_with :api, pos, status: :ok
		else
			render json: { errors: "The api is clearly brokend, couse it contains no locations" }, status: :not_found
		end
	end

	def show
		pos = Position.find_by_id(params[:id])
		if pos.nil?
			render json: { errors: "Couldn't find that position, you probably gave me the wrong ID" }, status: :not_found
		else
			respond_with :api, pos
		end
	end

	def destroy
		if pos = Position.find_by_id(params[:id])
			pos.destroy
			render json: { action: "destroy", message: "The location named  '#{pos.name}' is gone.", status: :ok}
		else
			render json: { errors: "Couldn't find location. Allways give me a valid ID" }, status: :not_found
		end
	end

	def update
		if pos = Position.find_by_id(params[:id])
			if pos.update(position_params)
				ps = pos.as_json(only: [:id, :address, :latitude, :longitude])
				respond_with :api, pos do |format|
					format.json { render json: { action: "update", adress_and_cordinats: ps }, status: :accepted }
				end
			else
				render json: { errors: pos.errors.messages }, status: :bad_request
			end
		else
			render json: { errors: "Couldn't find location. Sure you wrote the right Id?" }, status: :not_found
		end
	end

	def create
		pos = Position.new(position_params)
		if Position.where(adress: pos.adress).present?
			render json: { errors: "This location is already in use" }, status: :conflict
		else
			if pos.save
				respond_with :api, pos, status: :created
			else
				render json: { errors: pos.errors.messages }, status: :bad_request
			end
		end
	end

	private
	def position_params
		json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
		json_params.require(:position).permit(:adress, :systembolag_id)
	end

end
