class SessionsController < ApplicationController
  def new
  end

  def create
    sign_in(session_params[:email]) # gets email value from the session form
    redirect_to root_path # we need to modify signed in to return true
  end

  private

  def session_params
    params.require(:session).permit(:email)
  end
end
