class ApplicationsController < ApplicationController
  before_action :set_owner
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /@:login_name
  def index
    @applications = @owner.applications
  end

  # GET /@:login_name/:app_name
  def show
  end

  # GET /apps/new
  def new
    # FIXME: Should be able to change new application's owner
    @application = current_user.applications.build
  end

  # GET /@:login_name/:app_name/edit
  def edit
  end

  # POST /apps
  def create
    @application = Application.new(application_params)

    if @application.save
      redirect_to app_url(login_name: current_user.login_name, app_name: @application.name), notice: 'Application was successfully created.'
    else
      render :new
    end
  end

  # PATCH /@:login_name/:app_name
  def update
    if @application.update(application_params)
      redirect_to app_url(login_name: @owner.login_name, app_name: @application.name), notice: 'Application was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /@:login_name/:app_name
  def destroy
    @application.destroy
    redirect_to app_url(login_name: @owner.login_name), notice: 'Application was successfully destroyed.'
  end

  private
    def set_owner
      @owner = User.find_by(login_name: params[:login_name])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = @owner.applications.find_by!(name: params[:app_name])
    end

    # Only allow a trusted parameter "white list" through.
    def application_params
      params.fetch(:application, {}).permit(:name, :description, :owner_id, :owner_type)
    end
end
