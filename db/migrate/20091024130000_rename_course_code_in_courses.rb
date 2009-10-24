class RenameCourseCodeInCourses < ActiveRecord::Migration
  def self.up
    add_column :courses,:course_code_id,:integer
    remove_column :courses,:code
    remove_column :courses,:subject
  end

  def self.down
    remove_column(:courses, :course_code_id)
    add_column :courses,:code,:integer
    add_column :courses,:subject,:string
  end
end
