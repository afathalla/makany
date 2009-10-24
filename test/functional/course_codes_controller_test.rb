require 'test_helper'

class CourseCodesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:course_codes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_course_code
    assert_difference('CourseCode.count') do
      post :create, :course_code => { }
    end

    assert_redirected_to course_code_path(assigns(:course_code))
  end

  def test_should_show_course_code
    get :show, :id => course_codes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => course_codes(:one).id
    assert_response :success
  end

  def test_should_update_course_code
    put :update, :id => course_codes(:one).id, :course_code => { }
    assert_redirected_to course_code_path(assigns(:course_code))
  end

  def test_should_destroy_course_code
    assert_difference('CourseCode.count', -1) do
      delete :destroy, :id => course_codes(:one).id
    end

    assert_redirected_to course_codes_path
  end
end
