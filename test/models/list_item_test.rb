require 'test_helper'

class ListItemTest < ActiveSupport::TestCase
  def setup
    @listitem = ListItem.new(my_list_id: 1, item_id: 1)
  end

  test "should be valid" do
    assert @listitem.valid?
  end

  test "should require a list id" do
    @listitem.my_list_id = nil
    assert_not @listitem.valid?
  end

  test "should require a item id" do
    @listitem.item_id = nil
    assert_not @listitem.valid?
  end

  #add tests to confirm list item relationships are destroyed if either the
  #list or the item is destroyed. 
end
