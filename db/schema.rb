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

ActiveRecord::Schema.define(version: 2019_10_13_191749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "peeps", force: :cascade do |t|
    t.string "content", limit: 140
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "parent_id"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "tagger_id"
    t.integer "peep_id"
    t.boolean "read"
  end

  create_table "user_passwords", force: :cascade do |t|
    t.string "passhash"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "handle", limit: 100
    t.string "name", limit: 100
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", limit: 100
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["handle"], name: "index_users_on_handle", unique: true
  end

  add_foreign_key "peeps", "peeps", column: "parent_id"
  add_foreign_key "peeps", "users"
  add_foreign_key "tags", "peeps"
  add_foreign_key "tags", "users"
  add_foreign_key "tags", "users", column: "tagger_id"
  add_foreign_key "user_passwords", "users"
end
