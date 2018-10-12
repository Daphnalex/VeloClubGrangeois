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

ActiveRecord::Schema.define(version: 2018_10_12_110923) do

  create_table "album_attachments", force: :cascade do |t|
    t.integer "album_id"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "picture"
    t.text "resume"
    t.datetime "date"
    t.text "content"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pictyre_file_name"
    t.string "pictyre_content_type"
    t.integer "pictyre_file_size"
    t.datetime "pictyre_updated_at"
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean "slider", default: false
    t.string "type_of_data", default: "article"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "phone"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  create_table "exits", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "date"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_of_data", default: "exit"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gallery_attachments", force: :cascade do |t|
    t.integer "gallery_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.text "image_one"
    t.text "image_two"
    t.text "image_three"
    t.text "image_four"
    t.string "image_one_file_name"
    t.string "image_one_content_type"
    t.integer "image_one_file_size"
    t.datetime "image_one_updated_at"
    t.string "image_two_file_name"
    t.string "image_two_content_type"
    t.integer "image_two_file_size"
    t.datetime "image_two_updated_at"
    t.string "image_three_file_name"
    t.string "image_three_content_type"
    t.integer "image_three_file_size"
    t.datetime "image_three_updated_at"
    t.string "image_four_file_name"
    t.string "image_four_content_type"
    t.integer "image_four_file_size"
    t.datetime "image_four_updated_at"
  end

  create_table "presentations", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "title"
    t.integer "quantity"
    t.datetime "date"
    t.string "front_image_file_name"
    t.string "front_image_content_type"
    t.integer "front_image_file_size"
    t.datetime "front_image_updated_at"
    t.string "back_image_file_name"
    t.string "back_image_content_type"
    t.integer "back_image_file_size"
    t.datetime "back_image_updated_at"
    t.text "promotion"
    t.boolean "home"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname", default: "", null: false
    t.string "lastname", default: "", null: false
    t.string "rights", default: "Adhérent", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
