class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.string :subject

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
