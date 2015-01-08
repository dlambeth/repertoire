class Api::V1::MyListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_default_response_format
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
      respond_with :api, :v1, @mylist
    else
      #todo error handling
    end

  end

  def update
    @myList = MyList.find(params[:id])
    if @myList.update_attributes(mylist_params)
      respond_with @myList
    end
  end

  def destroy
  end

  protected

    def set_default_response_format
      request.format = :json
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
