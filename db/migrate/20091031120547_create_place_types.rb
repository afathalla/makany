class CreatePlaceTypes < ActiveRecord::Migration
  def self.up
    create_table :place_types do |t|
      t.string :place_type
      t.string :place_description

      t.timestamps
    end
  end

  def self.down
    drop_table :place_types
  end
end
