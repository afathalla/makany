class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :place_name
      t.integer :type_id
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
