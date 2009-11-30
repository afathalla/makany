class AddAddressCityToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places,:address,:string
    add_column :places,:city_id,:integer
  end

  def self.down
    remove_column :places,:address,:string
    remove_column :places,:city_id,:integer
  end
end
