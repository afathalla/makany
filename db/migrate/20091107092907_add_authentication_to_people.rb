class AddAuthenticationToPeople < ActiveRecord::Migration
 #Adds Authlogic columns to People table
  def self.up
    add_column :people, :username, :string
    add_column :people, :email, :string
    add_column :people, :crypted_password, :string
    add_column :people, :password_salt, :string
    add_column :people, :persistence_token, :string

  end

  def self.down
    remove_column :people, :username, :string
    remove_column :people, :email, :string
    remove_column :people, :crypted_password, :string
    remove_column :people, :password_salt, :string
    remove_column :people, :persistence_token, :string
  end
end
