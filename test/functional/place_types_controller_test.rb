require 'test_helper'

class PlaceTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:place_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_place_type
    assert_difference('PlaceType.count') do
      post :create, :place_type => { }
    end

    assert_redirected_to place_type_path(assigns(:place_type))
  end

  def test_should_show_place_type
    get :show, :id => place_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => place_types(:one).id
    assert_response :success
  end

  def test_should_update_place_type
    put :update, :id => place_types(:one).id, :place_type => { }
    assert_redirected_to place_type_path(assigns(:place_type))
  end

  def test_should_destroy_place_type
    assert_difference('PlaceType.count', -1) do
      delete :destroy, :id => place_types(:one).id
    end

    assert_redirected_to place_types_path
  end
end
