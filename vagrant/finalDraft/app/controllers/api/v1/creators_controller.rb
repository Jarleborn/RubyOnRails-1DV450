class Api::V1::CreatorsController < Api::V1::BaseController

	 before_action :offset_params, only: [:index]
  before_action :key_access

  def show
    crtr = Creator.find_by_id(params[:id])
    if crtr.nil?
      render json: { errors: "Couldn't find that creator, you probably gave me the wrong ID" }, status: :not_found
    else
      respond_with :api, crtr
    end
  end

  def index
    creators = Creator.all
    creators = creators.drop(@offset)
    creators = creators.take(@limit)
    respond_with :api, creators, status: :ok
  end

end

