require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get loggin" do
    get :loggin
    assert_response :success
  end

end
