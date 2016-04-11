# test for basic group controller function
# File: groups_controller_test.rb
# Author: Kyle Kilbride
require 'test_helper'


class GroupsControllerTest < ActionController::TestCase
  test "should get show" do
    user = User.where('first_name' => "Kyle").take!
    session[:user_id] = user.id
    group = Group.where('name' => "Kyle's Group").take!
    get :show, id: group.id
    assert_response :success
  end


end
