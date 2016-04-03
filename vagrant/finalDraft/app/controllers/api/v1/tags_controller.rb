class Api::V1::TagsController < Api::V1::BaseController
	before_action :offset_params, only: [:index]
	before_action :key_access

	def index
		tags = Tag.all
		tags = tags.drop(@offset)
		tags = tags.take(@limit)
		respond_with :api, tags, status: :ok
	end
	def show
		tg = Tag.find_by_id(params[:id])
		if tg.nil?
			render json: { errors: "Couldn't find that tag, you probably gave me the wrong ID, or CSG was on your back" }, status: :not_found
		else
			respond_with :api, tg
		end
	end
	def update
		if tag = Tag.find_by_id(params[:id])
			if tag.update(tag_params)
				tg = tag.as_json(only: [:id, :name])
				respond_with :api, tag do |format|
					format.json { render json: { action: "update", tag: tg }, status: :accepted }
				end
			else
				render json: { errors: tag.errors.messages }, status: :bad_request
			end
		else
			render json: { errors: "Couldn't find tag. Sure you wrote the right Id?" }, status: :not_found
		end
	end
	def destroy
		if tag = Tag.find_by_id(params[:id])
			tag.destroy
			render json: { action: "destroy", message: "The tag  is gone.", status: :ok}
		else
			render json: { errors: "Couldn't find tag. Allways give me a valid ID" }, status: :not_found
		end
	end
	def create
		tag = Tag.new(tag_params)
		if Tag.where(name: Tag.name).present?
			render json: { errors: "This tag is already in use" }, status: :conflict
		else
			if tag.save
				respond_with :api, tag, status: :created
			else
				render json: { errors: tag.errors.messages }, status: :bad_request
			end
		end

	end
	private
	def tag_params
		json_params = ActionController::Parameters.new( JSON.parse(request.body.read) )
		json_params.require(:tag).permit(:name)
	end
end
