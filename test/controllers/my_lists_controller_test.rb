require 'test_helper'

class MyListsControllerTest < ActionController::TestCase
  def setup
    @mylist = my_lists(:fats)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'MyList.count' do
      post :create, my_list: { title: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'MyList.count' do
      delete :destroy, id: @mylist
    end
    assert_redirected_to login_url
  end
end
