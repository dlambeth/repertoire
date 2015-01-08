class Api::V1::ListItemsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json
  #just punt and always ensure we are returning json
  before_action :set_default_response_format

  def create
    @listItem = ListItem.create(list_item_params)
    #todo: for now just return the list item.  Eventually I think we will
    #want to return the list when we add support for positioning.
    respond_to do |format|
       format.json { render :json => @listItem }
    end
     #respond_with :api, :v1 @listItem
  end

  def destroy
    listItem = ListItem.find(params[:id])
    list = listItem.my_list
    list.remove_item(listItem.item)
  end

  private
    def list_item_params
      params.require(:list_item).permit(:item_id, :my_list_id)
    end
end