class SessionsController < ApplicationController

  skip_authorization_check

  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      if (current_user.has_role? :charity) 
        redirect_to dashboard_path, notice: 'Log in successful!'
      elsif (current_user.has_role? :admin) 
        redirect_to dash_path, notice: 'Log in successful!'
      else
        redirect_to current_user, notice: 'Log in successful!'
      end
    else
      flash[:error] = "Incorrect username/password! Please try again!" 
      redirect_to login_path

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



