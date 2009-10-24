class AddPlaceIdToSection < ActiveRecord::Migration
  def self.up
    add_column :sections, :place_id, :integer
  end

  def self.down
    remove_column :sections, :place_id
  end
end
