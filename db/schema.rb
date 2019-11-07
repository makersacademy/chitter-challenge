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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "peeps", id: :serial, force: :cascade do |t|
    t.string "content", limit: 240
    t.string "date", limit: 10
    t.string "time", limit: 5
    t.integer "user_id"
  end

  create_table "replies", id: :serial, force: :cascade do |t|
    t.string "content", limit: 240
    t.string "date", limit: 10
    t.string "time", limit: 5
    t.integer "user_id"
    t.integer "peep_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 20
    t.string "email", limit: 60
    t.string "password", limit: 30
  end

  add_foreign_key "peeps", "users", name: "peeps_user_id_fkey", on_delete: :cascade
  add_foreign_key "replies", "peeps", name: "replies_peep_id_fkey", on_delete: :cascade
  add_foreign_key "replies", "users", name: "replies_user_id_fkey"
end
