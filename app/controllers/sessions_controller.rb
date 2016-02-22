class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to current_user, notice: 'Log in successful!'
      # redirect_to users/user.id_url, notice: 'Logged in!'
    else
      render :new
    end
  # def create
  #    charity = Charity.find_by_email(params[:email])
  #   if charity && charity.authenticate(params[:password])
  #     session[:charity_id] = charity.id
  #     redirect_to current_charity, notice: 'Log in successful!'
  #     # redirect_to users/user.id_url, notice: 'Logged in!'
  #   else
  #     render :new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'    
    # redirect_to volMenu_url, notice: 'Logged out!'
  end


end

