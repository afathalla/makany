class CreateFriendInvitations < ActiveRecord::Migration
  def self.up
    create_table :friend_invitations do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.datetime :sent_at

      t.timestamps
    end
  end

  def self.down
    drop_table :friend_invitations
  end
end
