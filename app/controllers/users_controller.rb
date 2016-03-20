class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
skip_authorization_check
    def search
    if params[:search].present?
      @users = User.search(params[:search])
    else
      @users = User.all
    end
  end

  # GET /users
  def menu
    @users = User.all

  if params[:tag]
    @users = User.tagged_with(params[:tag])
  else
    @users = User.all
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
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'You are now a TFC volunteer!'
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

  if current_user && (current_user.has_role? :admin) 
      params.require(:user).permit(:charity_name, :first_name, :last_name, :location, :about, :email, :password, :password_confirmation, :avatar, :phone, :tax_number)
    end
  if !(current_user) 
      params.require(:user).permit(:first_name, :last_name, :hobbies, :occupation, :location, :about, :tag_list, :email, :password, :password_confirmation, :avatar, :roles[])
    end
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
