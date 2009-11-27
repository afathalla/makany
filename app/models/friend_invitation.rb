class FriendInvitation < ActiveRecord::Base
  belongs_to :sender, :class_name => 'Person'
  belongs_to :receiver, :class_name => 'Person'

end
