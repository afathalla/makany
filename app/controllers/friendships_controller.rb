class FriendshipsController < ApplicationController
  def create
     @friendship = current_person.friendships.build(:friend_id => params[:friend_id])
     if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to people_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to people_url
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
