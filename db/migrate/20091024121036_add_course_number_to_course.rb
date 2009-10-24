class AddCourseNumberToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :course_number, :integer
  end

  def self.down
    remove_column :courses, :course_number
  end
end
