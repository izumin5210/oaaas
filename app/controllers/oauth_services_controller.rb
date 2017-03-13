class OauthServicesController < ApplicationController
  before_action :set_owner
  before_action :set_application
  before_action :set_oauth_service, only: [:show, :edit, :update, :destroy]

  # GET /@:login_name/:app_name/services/1
  def show
  end

  # GET /@:login_name/:app_name/services/new
  def new
    @oauth_service = @application.oauth_services.build
  end

  # GET /@:login_name/:app_name/services/1/edit
  def edit
  end

  # POST /@:login_name/:app_name/services
  def create
    @oauth_service = OauthService.new(oauth_service_params)

    if @oauth_service.save
      redirect_to oauth_service_path(@oauth_service, login_name: @owner.login_name, app_name: @application.name), notice: 'Oauth service was successfully created.'
    else
      render :new
    end
  end

  # PATCH /@:login_name/:app_name/services/1
  def update
    if @oauth_service.update(oauth_service_params)
      redirect_to @oauth_service, notice: 'Oauth service was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /@:login_name/:app_name/services/1
  def destroy
    @oauth_service.destroy
    redirect_to oauth_services_url, notice: 'Oauth service was successfully destroyed.'
  end

  private
    def set_owner
      @owner = User.find_by(login_name: params[:login_name])
    end

    def set_application
      @application = @owner.applications.find_by!(name: params[:app_name])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_oauth_service
      @oauth_service = @application.oauth_services.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def oauth_service_params
      params.fetch(:oauth_service, {})
        .permit(:consumer_key, :consumer_secret, :scope, :provider, :name, :application_id)
    end
end
