class CreateCourseCodes < ActiveRecord::Migration
  def self.up
    create_table :course_codes do |t|
      t.string :code_name,:limit => 4
      t.string :code_subject

      t.timestamps
    end
  end

  def self.down
    drop_table :course_codes
  end
end
