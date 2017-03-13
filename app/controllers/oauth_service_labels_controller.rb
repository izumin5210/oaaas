class OauthServiceLabelsController < ApplicationController
  before_action :set_owner
  before_action :set_application
  before_action :set_oauth_service_label, only: [:edit, :update, :destroy]

  # GET /oauth_service_labels/new
  def new
    @oauth_service_label = OauthServiceLabel.new
  end

  # GET /oauth_service_labels/1/edit
  def edit
  end

  # POST /oauth_service_labels
  def create
    @oauth_service_label = @application.oauth_service_labels.build(oauth_service_label_params)

    if @oauth_service_label.save
      redirect_to app_url(login_name: current_user.login_name, app_name: @application.name), notice: 'Oauth service label was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /oauth_service_labels/1
  def update
    if @oauth_service_label.update(oauth_service_label_params)
      redirect_to app_url(login_name: current_user.login_name, app_name: @application.name), notice: 'Oauth service label was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /oauth_service_labels/1
  def destroy
    @oauth_service_label.destroy
    redirect_to app_url(login_name: current_user.login_name, app_name: @application.name), notice: 'Oauth service label was successfully destroyed.'
  end

  private
    def set_owner
      @owner = User.find_by(login_name: params[:login_name])
    end

    def set_application
      @application = @owner.applications.find_by!(name: params[:app_name])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_oauth_service_label
      @oauth_service_label = OauthServiceLabel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def oauth_service_label_params
      params.fetch(:oauth_service_label, {}).permit(:name)
    end
end
