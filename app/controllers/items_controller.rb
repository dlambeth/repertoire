class ItemsController < ApplicationController
  respond_to :json
  before_action :logged_in_user #, only: [:create, :destroy]
  
  def index
    respond_with current_user.items
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "Item created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def update
    respond_with item.update(item_params)
  end

  def destroy
  end

  private

    def item_params
      params.require(:item).permit(:title)
    end
end
