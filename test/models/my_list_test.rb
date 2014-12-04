require 'test_helper'

class MyListTest < ActiveSupport::TestCase
  def setup
    @user = users(:dawn)
    @user2 = users(:michael)
    @title = "Songs for Summertime"
    @my_list = @user.lists.build(title: @title)
  end

  test "should be valid" do 
    assert @my_list.valid?
  end

  test "user id should be present" do
    @my_list.user_id = nil
    assert_not @my_list.valid?
  end

  test "title should be present " do
    @my_list.title = "   "
    assert_not @my_list.valid?
  end

  test "title should be at most 150 characters" do
    @my_list.title = "a" * 151
    assert_not @my_list.valid?
  end

  test "order should be most recent first" do
    assert_equal MyList.first, my_lists(:most_recent)
  end

=begin
  #Within a given users lists all titles should be unique, not sure if we want it or not?
  test "title should be unique for a given user" do
    @my_list.title = @title
    @user.save
    second_list = @user.lists.build(title: @title)
    @user.save
    assert_not second_list.valid?
  end
=end
end
