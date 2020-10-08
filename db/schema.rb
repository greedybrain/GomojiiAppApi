# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_07_131547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emojis", force: :cascade do |t|
    t.string "slug"
    t.string "character"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unicodeName"
    t.string "codePoint"
    t.string "group"
    t.string "subGroup"
    t.text "variants"
  end

  create_table "user_favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "emoji_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["emoji_id"], name: "index_user_favorites_on_emoji_id"
    t.index ["user_id"], name: "index_user_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "user_favorites", "emojis"
  add_foreign_key "user_favorites", "users"
end
