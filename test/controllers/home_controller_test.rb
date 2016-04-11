require 'test_helper'

# Test for the home_controller
# File: home_controller_test.rb
# Author: Kyle Kilbride

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
  	user = User.where('first_name' => "Kyle").take!
  	session[:user_id] = user.id
    get :index
    assert_response :success
  end

end
