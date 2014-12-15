class MyListsController < ApplicationController
  before_action :logged_in_user #, only: [:create, :destroy]
  respond_to :json

  def index
    #respond_with MyList.all
    respond_with current_user.lists
  end

  def show
    respond_with my_list
  end

  def create
    @mylist = current_user.lists.build(mylist_params)
    if @mylist.save
      respond_with @mylist
    else
      #todo error handling
    end

  end

  def destroy
  end

  private
    def my_lists
      @_myLists ||= MyList.all
    end

    def my_list
      @_my_list ||= my_lists.find(params[:id])
    end

    def mylist_params
      params.require(:my_list).permit(:title)
    end
end
