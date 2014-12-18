class ListItemsController < ApplicationController
  before_action :logged_in_user

  def create
    logger.debug "list item params #{params.inspect}, there you go"
    logger.debug "result of list_item_params method #{list_item_params.inspect}"
    listItem = ListItem.create(list_item_params)
    #list = current_user.lists.find(listItem.my_list)
    #item = params[:item_id]
    #list.add_item(item.id)
    respond_to do |format|
      format.js listItem
    end
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