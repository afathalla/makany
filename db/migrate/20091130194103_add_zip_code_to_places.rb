class AddZipCodeToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places, :zip_code,:integer  
  end

  def self.down
    remove_column :places, :zip_code,:integer
  end
end
