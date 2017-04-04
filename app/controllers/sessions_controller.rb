class SessionsController < ApplicationController
  def new
  end

  def create
    session[:current_email] = params.require(:session).permit(:email)[:email] # gets email value from the session form
    redirect_to root_path # we need to modify signed in to return true
  end
end
