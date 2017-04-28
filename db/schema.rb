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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170407120301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "title2"
    t.text     "description2"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.boolean  "black"
  end

  create_table "booking_pictures", force: :cascade do |t|
    t.integer  "booking_post_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "booking_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "title2"
    t.text     "description2"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contact_us", force: :cascade do |t|
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "fb"
    t.string   "insta"
    t.string   "vk"
    t.string   "phone"
    t.string   "phone2"
    t.string   "phone3"
    t.text     "description"
    t.text     "description2"
    t.string   "adress"
    t.string   "adress2"
    t.string   "twitter"
    t.string   "email"
    t.text     "how_to_get"
    t.text     "how_to_get2"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "entertainments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "black"
    t.string   "title2"
    t.text     "description2"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "album_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "main_shots", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "description2"
    t.string   "title2"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "align"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_slides", force: :cascade do |t|
    t.string   "description"
    t.integer  "position_id"
    t.string   "description2"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "title"
    t.string   "title2"
    t.boolean  "black"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "description"
    t.string   "title"
    t.string   "title2"
    t.text     "description2"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "black",              default: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "booking_post_id"
    t.string   "email"
    t.string   "phone_number"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "start"
    t.date     "end"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

end
