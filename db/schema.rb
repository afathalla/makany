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

ActiveRecord::Schema.define(:version => 20091121184244) do

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
    t.integer  "course_number"
    t.integer  "course_code_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "person_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "people_places", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "place_id"
  end

  create_table "place_types", :force => true do |t|
    t.string   "place_type"
    t.string   "place_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "place_name"
    t.integer  "type_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.integer  "course_id"
    t.integer  "section_number"
    t.integer  "student_enrollment"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
  end

end
