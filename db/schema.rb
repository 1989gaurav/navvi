# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140223032102) do

  create_table "floors", :force => true do |t|
    t.integer  "store_id"
    t.string   "nick"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "floors", ["nick"], :name => "index_floors_on_nick"
  add_index "floors", ["store_id"], :name => "index_floors_on_store_id"

  create_table "sections", :force => true do |t|
    t.integer  "floor_id"
    t.decimal  "longitude",          :precision => 10, :scale => 0
    t.decimal  "latitude",           :precision => 10, :scale => 0
    t.string   "nick"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "sections", ["floor_id"], :name => "index_sections_on_floor_id"

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.decimal  "longitude",  :precision => 9, :scale => 6
    t.decimal  "latitude",   :precision => 9, :scale => 6
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

end
