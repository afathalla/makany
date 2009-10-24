# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091024130000) do

  create_table "course_codes", :force => true do |t|
    t.string   "code_name",    :limit => 4
    t.string   "code_subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_number",  :limit => 11
    t.integer  "course_code_id", :limit => 11
  end

  create_table "places", :force => true do |t|
    t.string   "place_name"
    t.integer  "type_id",     :limit => 11
    t.integer  "location_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.integer  "course_id",          :limit => 11
    t.integer  "section_number",     :limit => 11
    t.integer  "student_enrollment", :limit => 11
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id",           :limit => 11
  end

end
