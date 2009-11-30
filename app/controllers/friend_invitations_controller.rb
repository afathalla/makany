class FriendInvitationsController < ApplicationController
  # GET /friend_invitations
  # GET /friend_invitations.xml
  def index
    @friend_invitations = FriendInvitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friend_invitations }
    end
  end

  # GET /friend_invitations/1
  # GET /friend_invitations/1.xml
  def show
    @friend_invitation = FriendInvitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friend_invitation }
    end
  end

  # GET /friend_invitations/new
  # GET /friend_invitations/new.xml
  def new
    @friend_invitation = FriendInvitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @friend_invitation }
    end
  end

  # GET /friend_invitations/1/edit
  def edit
    @friend_invitation = FriendInvitation.find(params[:id])
  end

  # POST /friend_invitations
  # POST /friend_invitations.xml
  def create
     @friend_invitation = current_person.sent_friend_invitations.build(:receiver_id => params[:receiver_id])
     if @friend_invitation.save
       PersonMailer.deliver_friend_invitation(@friend_invitation)
      flash[:notice] = "Invitation sent to " << @friend_invitation.receiver.full_name
      redirect_to current_person
    else
      flash[:notice] = "Unable to send invitation to " << @friend_invitation.receiver.full_name
      redirect_to current_person
    end
 end

  # PUT /friend_invitations/1
  # PUT /friend_invitations/1.xml
  def update
    @friend_invitation = FriendInvitation.find(params[:id])

    respond_to do |format|
      if @friend_invitation.update_attributes(params[:friend_invitation])
        flash[:notice] = 'FriendInvitation was successfully updated.'
        format.html { redirect_to(@friend_invitation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend_invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_invitations/1
  # DELETE /friend_invitations/1.xml
  def destroy
    @friend_invitation = FriendInvitation.find(params[:id])
    @friend_invitation.destroy

    respond_to do |format|
      format.html { redirect_to(friend_invitations_url) }
      format.xml  { head :ok }
    end
  end
end
