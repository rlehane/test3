class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
skip_authorization_check


    def search
    if params[:tag].present?
      @users = User.with_any_skills(params[:search])
    elsif params[:search].present?
      @users = User.search(params[:search])
    else
      @users = User.all
    end
  end


  # GET /users
  def menu
    @users = User.all

    # if params[:tag]
    #   @users = User.tagged_with(user.params[:tag])
    # else
    #   @users = User.all
    # end
  end


  def index
    @users = User.all
  end



  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def newChar
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    if current_user && (current_user.has_role? :admin)
      @charity = User.new(charity_params)
      @charity.add_role "charity"
      if @charity.save!
        redirect_to @charity
      else 
        redirect_to action: :new
      end
    else 
      @user = User.new(user_params)
      @user.skills = params[:user][:skills].split(',').map(&:strip)

      if @user.save
        session[:user_id] = @user.id
        if current_user.has_role? :charity
          redirect_to dashboard_path, notice: 'You have registered a new charity!'
        else
          redirect_to @user, notice: 'You are now a TFC volunteer!'
        end
      else
        render :new
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Your volunteer profile was successfully updated!'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Your volunteer profile was successfully destroyed!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  def user_params
      params.require(:user).permit(:first_name, :last_name, :hobbies, :occupation, :location, :about, :email, :password, :password_confirmation, :avatar)
  end

  def charity_params
      params.require(:user).permit(:charity_name, :first_name, :last_name, :location, :about, :email, :password, :password_confirmation, :avatar, :phone, :tax_number)
  end
 




# Membership: user_id, charity_id, role

# Users -> sessiony stuff
# |-> have_many memberships

# Charities -> content creation
# |-> have_many memberships

#  enum Role {
#   :volunteer,
#   :adminstrator



end
