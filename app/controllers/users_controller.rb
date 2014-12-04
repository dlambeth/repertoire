class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  #show all users  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @mylists = @user.lists.paginate(page: params[:page])
     #use byebug to enter debugging mode in the server
    #debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url

    else
      render 'new'
    end
  end

  #looks up the user and shows the edit form. the correct_user filter
  #actually handles the look up and setting of @user
  def edit
    
  end

  def update
    if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
      redirect_to @user

    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private

    def user_params
      #require the params hash to have a user attribute and 
      #permit the user hash to have specified attributes.
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    #confirms that the user accesing the page is the right user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
