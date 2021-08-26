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

ActiveRecord::Schema.define(version: 2021_08_25_075854) do

  create_table "peeps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "message", limit: 140, null: false
    t.index ["user_id"], name: "index_peeps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 20, null: false
    t.string "last_name", limit: 20, null: false
    t.string "username", limit: 20, null: false
    t.string "email", limit: 60, null: false
    t.string "password", limit: 20, null: false
  end

end
