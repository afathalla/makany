class Person < ActiveRecord::Base
acts_as_authentic
#Relationships
belongs_to :location
has_and_belongs_to_many :places

has_many :friendships
has_many :friends, :through => :friendships
has_many :inverse_friendships, :class_name => 'Friendship',:foreign_key => 'friend_id'
has_many :inverse_friends, :through => :inverse_friendships, :source=>:people

has_many :sent_friend_invitations, :class_name => 'FriendInvitation',:foreign_key => 'sender_id'
has_many :received_friend_invitations, :class_name => 'FriendInvitation',:foreign_key => 'receiver_id'

#PaperClip Properties
has_attached_file :photo ,:styles => {:small=>'75x75',:medium=>'200x200'}
validates_attachment_size :photo, :less_than => 500.kilobytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png','image/gif']

#Methods
  def full_name
    "#{first_name} #{last_name}"
  end

  def role_sumbols
    if admin?
      [:admin]
    else
      [:user]
    end
  end
end
