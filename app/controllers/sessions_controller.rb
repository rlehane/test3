class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_url, notice: 'Logged in!'
      # redirect_to users/user.id_url, notice: 'Logged in!'
    else
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to users_url, notice: 'Logged out!'    
    # redirect_to volMenu_url, notice: 'Logged out!'
  end
end

