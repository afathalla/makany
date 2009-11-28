require 'test_helper'

class FriendInvitationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friend_invitations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friend_invitation" do
    assert_difference('FriendInvitation.count') do
      post :create, :friend_invitation => { }
    end

    assert_redirected_to friend_invitation_path(assigns(:friend_invitation))
  end

  test "should show friend_invitation" do
    get :show, :id => friend_invitations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => friend_invitations(:one).to_param
    assert_response :success
  end

  test "should update friend_invitation" do
    put :update, :id => friend_invitations(:one).to_param, :friend_invitation => { }
    assert_redirected_to friend_invitation_path(assigns(:friend_invitation))
  end

  test "should destroy friend_invitation" do
    assert_difference('FriendInvitation.count', -1) do
      delete :destroy, :id => friend_invitations(:one).to_param
    end

    assert_redirected_to friend_invitations_path
  end
end
