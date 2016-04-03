class ApikeysController < ApplicationController
	before_action :require_login
	def show
		if is_admin?
			@users_apps = Applikation.all
		else
			@users_apps = User.find(current_user.id).applikations
		end

	end

	def destroy
		@app = Applikation.find(params[:id])
		if @app.user_id == current_user.id || is_admin?
			@app.destroy
		end

		redirect_to apikey_path
	end


	def new
		@app = Applikation.new
	end

	def create
		@app = Applikation.new(app_params)
		@app.user_id = current_user.id
		@app.app_key = SecureRandom.hex
		if @app.save
			redirect_to apikeys_path
		else
			render action: 'new'
		end
	end

	private
	def app_params
		params.require(:app).permit(:app_name)
	end
end
