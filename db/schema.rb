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

ActiveRecord::Schema.define(version: 2020_08_29_125357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "post"
    t.datetime "created_at", default: -> { "now()" }
    t.integer "user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name", limit: 40
  end

  add_foreign_key "posts", "users", name: "posts_user_id_fkey"
end
