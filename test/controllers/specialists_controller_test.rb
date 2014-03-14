require 'test_helper'

class SpecialistsControllerTest < ActionController::TestCase
  setup do
    @specialist = specialists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specialists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specialist" do
    assert_difference('Specialist.count') do
      post :create, specialist: { person_id: @specialist.person_id, shift: @specialist.shift, speciality: @specialist.speciality }
    end

    assert_redirected_to specialist_path(assigns(:specialist))
  end

  test "should show specialist" do
    get :show, id: @specialist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specialist
    assert_response :success
  end

  test "should update specialist" do
    patch :update, id: @specialist, specialist: { person_id: @specialist.person_id, shift: @specialist.shift, speciality: @specialist.speciality }
    assert_redirected_to specialist_path(assigns(:specialist))
  end

  test "should destroy specialist" do
    assert_difference('Specialist.count', -1) do
      delete :destroy, id: @specialist
    end

    assert_redirected_to specialists_path
  end
end
