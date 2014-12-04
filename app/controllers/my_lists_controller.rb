class MyListsController < ApplicationController
  before_action :logged_in_user #, only: [:create, :destroy]

  def create
    @mylist = current_user.lists.build(mylist_params)
    if @mylist.save
      flash[:success] = "List created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def mylist_params
      params.require(:my_list).permit(:title)
    end
end
