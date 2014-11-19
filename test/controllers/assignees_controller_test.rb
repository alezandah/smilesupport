require 'test_helper'

class AssigneesControllerTest < ActionController::TestCase
  setup do
    @assignee = assignees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignee" do
    assert_difference('Assignee.count') do
      post :create, assignee: { first_name: @assignee.first_name, job_title: @assignee.job_title, last_name: @assignee.last_name }
    end

    assert_redirected_to assignee_path(assigns(:assignee))
  end

  test "should show assignee" do
    get :show, id: @assignee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assignee
    assert_response :success
  end

  test "should update assignee" do
    patch :update, id: @assignee, assignee: { first_name: @assignee.first_name, job_title: @assignee.job_title, last_name: @assignee.last_name }
    assert_redirected_to assignee_path(assigns(:assignee))
  end

  test "should destroy assignee" do
    assert_difference('Assignee.count', -1) do
      delete :destroy, id: @assignee
    end

    assert_redirected_to assignees_path
  end
end
