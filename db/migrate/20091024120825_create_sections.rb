class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.integer :course_id
      t.integer :section_number
      t.integer :student_enrollment
      t.string :description


      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
