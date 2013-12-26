require 'test_helper'

class MinesControllerTest < ActionController::TestCase
  setup do
    @mine = mines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mine" do
    assert_difference('Mine.count') do
      post :create, mine: { description: @mine.description, expected_capacity: @mine.expected_capacity, latitude: @mine.latitude, longitude: @mine.longitude, name: @mine.name, real_capacity: @mine.real_capacity }
    end

    assert_redirected_to mine_path(assigns(:mine))
  end

  test "should show mine" do
    get :show, id: @mine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mine
    assert_response :success
  end

  test "should update mine" do
    patch :update, id: @mine, mine: { description: @mine.description, expected_capacity: @mine.expected_capacity, latitude: @mine.latitude, longitude: @mine.longitude, name: @mine.name, real_capacity: @mine.real_capacity }
    assert_redirected_to mine_path(assigns(:mine))
  end

  test "should destroy mine" do
    assert_difference('Mine.count', -1) do
      delete :destroy, id: @mine
    end

    assert_redirected_to mines_path
  end
end
