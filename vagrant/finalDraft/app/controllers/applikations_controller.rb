class ApplikationsController < ApplicationController

  def index
    @applikations = Applikation.all
  end

  def new
    @app = Applikation.new
  end

  def create
    @app = Applikation.new(app_params)
    @app.app_key = SecureRandom.hex
    if @app.save
      redirect_to appliaktions_path
    else
      render :action => "new"
    end
  end

  private

  def app_params
    params.require(:app).permit(:app_name)
  end
end
