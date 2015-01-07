class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @my_list = current_user.lists.build
      @mylists = current_user.lists.paginate(page: params[:page])
      @item = current_user.items.build
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
