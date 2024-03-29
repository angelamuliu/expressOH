require 'test_helper'

class UserRequestsControllerTest < ActionController::TestCase
  setup do
    @user_request = user_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_request" do
    assert_difference('UserRequest.count') do
      post :create, user_request: { request_id: @user_request.request_id, user_id: @user_request.user_id }
    end

    assert_redirected_to user_request_path(assigns(:user_request))
  end

  test "should show user_request" do
    get :show, id: @user_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_request
    assert_response :success
  end

  test "should update user_request" do
    patch :update, id: @user_request, user_request: { request_id: @user_request.request_id, user_id: @user_request.user_id }
    assert_redirected_to user_request_path(assigns(:user_request))
  end

  test "should destroy user_request" do
    assert_difference('UserRequest.count', -1) do
      delete :destroy, id: @user_request
    end

    assert_redirected_to user_requests_path
  end
end
