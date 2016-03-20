class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
	include CanCan::ControllerAdditions

    # check_authorization
  # check_authorization
  skip_authorization_check

@users = User.all
# rescue_from CanCan::AccessDenied do |exception|
#   flash[:error] = "Access denied!!!."
#   redirect_to jobs_url
# end


   def admin
  end
  private
  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user


end