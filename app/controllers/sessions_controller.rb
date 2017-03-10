class SessionsController < ApplicationController

  def new
    redirect_to "/auth/#{params[:provider]}"
  end

  def create
    cmd = FindOrCreateUserCommand.run(auth_hash: request.env['omniauth.auth'])

    if cmd.success?
      reset_session
      # FIXME: temporally implementation
      session[:user_id] = cmd.user.id
    else
      # cmd.errors ...
    end

    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
end
