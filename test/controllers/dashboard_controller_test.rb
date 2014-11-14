require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get tickets" do
    get :tickets
    assert_response :success
  end

  test "should get reports" do
    get :reports
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

end
