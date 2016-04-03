class Api::V1::BaseController < ApplicationController
	include Knock::Authenticable
	protect_from_forgery with: :null_session

	respond_to :json, :xml

	OFFSET = 0
	LIMIT = 15

	def offset_params
		@offset = params[:offset].to_i if params[:offset].present?
		@limit = params[:limit].to_i if params[:limit].present?

		@offset ||= OFFSET
		@limit  ||= LIMIT

	end
	def key_access
		key = Applikation.find_by(app_key: params[:app_key])
		unless key
			render json: { error: "Your api-key is not that very valid" }, status: :unauthorized
		end
	end
end
