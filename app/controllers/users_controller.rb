class UsersController < ApplicationController
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
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      #require the params hash to have a user attribute and 
      #permit the user hash to have specified attributes.
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
