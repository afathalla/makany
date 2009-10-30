class CreatePeoplePlaces < ActiveRecord::Migration
  def self.up
    create_table :people_places,:id=>false do |t|
      t.integer :person_id
      t.integer :place_id
    end
  end

  def self.down
    drop_table(:people_places)
  end
end
