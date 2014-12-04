require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  def setup
    @item = items(:first)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Item.count' do
      post :create, item: { title: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Item.count' do
      delete :destroy, id: @item
    end
    assert_redirected_to login_url
  end
end
