require 'test_helper'

class WantedActionsControllerTest < ActionController::TestCase
  setup do
    @wanted_action = wanted_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wanted_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wanted_action" do
    assert_difference('WantedAction.count') do
      post :create, wanted_action: { wanted_action: @wanted_action.wanted_action }
    end

    assert_redirected_to wanted_action_path(assigns(:wanted_action))
  end

  test "should show wanted_action" do
    get :show, id: @wanted_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wanted_action
    assert_response :success
  end

  test "should update wanted_action" do
    put :update, id: @wanted_action, wanted_action: { wanted_action: @wanted_action.wanted_action }
    assert_redirected_to wanted_action_path(assigns(:wanted_action))
  end

  test "should destroy wanted_action" do
    assert_difference('WantedAction.count', -1) do
      delete :destroy, id: @wanted_action
    end

    assert_redirected_to wanted_actions_path
  end
end
