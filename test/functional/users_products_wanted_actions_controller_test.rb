require 'test_helper'

class UsersProductsWantedActionsControllerTest < ActionController::TestCase
  setup do
    @users_products_wanted_action = users_products_wanted_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_products_wanted_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_products_wanted_action" do
    assert_difference('UsersProductsWantedAction.count') do
      post :create, users_products_wanted_action: { product_id: @users_products_wanted_action.product_id, user_id: @users_products_wanted_action.user_id, wanted_action_id: @users_products_wanted_action.wanted_action_id }
    end

    assert_redirected_to users_products_wanted_action_path(assigns(:users_products_wanted_action))
  end

  test "should show users_products_wanted_action" do
    get :show, id: @users_products_wanted_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_products_wanted_action
    assert_response :success
  end

  test "should update users_products_wanted_action" do
    put :update, id: @users_products_wanted_action, users_products_wanted_action: { product_id: @users_products_wanted_action.product_id, user_id: @users_products_wanted_action.user_id, wanted_action_id: @users_products_wanted_action.wanted_action_id }
    assert_redirected_to users_products_wanted_action_path(assigns(:users_products_wanted_action))
  end

  test "should destroy users_products_wanted_action" do
    assert_difference('UsersProductsWantedAction.count', -1) do
      delete :destroy, id: @users_products_wanted_action
    end

    assert_redirected_to users_products_wanted_actions_path
  end
end
