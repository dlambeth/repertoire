require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @user = users(:dawn)
    @title = "Winter Wonderland"
    @item = @user.items.build(title: @title)
  end

  test "should be valid" do 
    assert @item.valid?
  end

  test "user id should be present" do
    @item.user_id = nil
    assert_not @item.valid?
  end

  test "title should be present " do
    @item.title = "   "
    assert_not @item.valid?
  end

  test "title should be at most 150 characters" do
    @item.title = "a" * 151
    assert_not @item.valid?
  end

  test "order should be alphabetical" do
    assert_equal Item.first, items(:first)
  end

  test "can see associated lists" do
    assert_not
  end

  test "can add to a list" do

  end

end
