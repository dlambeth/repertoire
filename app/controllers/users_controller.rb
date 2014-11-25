class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
  end

  def show
    @user = User.find(params[:id])
     #use byebug to enter debugging mode in the server
    #debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
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
  
  private

    def user_params
      #require the params hash to have a user attribute and 
      #permit the user hash to have specified attributes.
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    #confirms that the user accesing the page is the right user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
