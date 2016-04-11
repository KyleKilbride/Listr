require 'test_helper'
# Test written to test the access controller
# File: access_controller_test.rb
# Author: Kyle Kilbride
class AccessControllerTest < ActionController::TestCase


  test "should get login" do
    get :login
    assert_response :success
  end

end
