require 'test_helper'

class TreatmentsControllerTest < ActionController::TestCase
  setup do
    @treatment = treatments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treatments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treatment" do
    assert_difference('Treatment.count') do
      post :create, treatment: { end_date: @treatment.end_date, observation: @treatment.observation, patient_id: @treatment.patient_id, specialist_id: @treatment.specialist_id, start_date: @treatment.start_date, treatment_type: @treatment.treatment_type }
    end

    assert_redirected_to treatment_path(assigns(:treatment))
  end

  test "should show treatment" do
    get :show, id: @treatment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treatment
    assert_response :success
  end

  test "should update treatment" do
    patch :update, id: @treatment, treatment: { end_date: @treatment.end_date, observation: @treatment.observation, patient_id: @treatment.patient_id, specialist_id: @treatment.specialist_id, start_date: @treatment.start_date, treatment_type: @treatment.treatment_type }
    assert_redirected_to treatment_path(assigns(:treatment))
  end

  test "should destroy treatment" do
    assert_difference('Treatment.count', -1) do
      delete :destroy, id: @treatment
    end

    assert_redirected_to treatments_path
  end
end
