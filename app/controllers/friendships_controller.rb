class FriendshipsController < ApplicationController
  def create
     @friendship = current_person.friendships.build(:friend_id => params[:friend_id])
     friend_name= @friendship.friend.full_name
    if @friendship.save
      flash[:notice] = friend_name << " is now your friend"
      #Removing friendship request now that they are friends
      @friend_invitation=current_person.received_friend_invitations.find_by_sender_id(params[:friend_id])
      @friend_invitation.destroy
      
      redirect_to current_person
    else
      flash[:notice] = "Unable to add friend."
      redirect_to current_person
    end
  end

   def destroy
      @friendship = current_person.friendships.find(params[:id])
      friend_name= @friendship.friend.full_name
      @friendship.destroy
      flash[:notice] = friend_name << " is no longer your friend"
      redirect_to current_person
    end
end
