#Adding Geographic Information to Places Model
class AddLatLongToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places,:lat,:float
    add_column :places,:lng,:float
  end

  def self.down
    remove_column :places,:lat,:float
    remove_column :places,:lng,:float
  end
end
