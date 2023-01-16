# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "peep_replies", id: :serial, force: :cascade do |t|
    t.string "content", limit: 144
    t.date "reply_date"
  end

  create_table "peep_tags", id: :integer, default: -> { "nextval('tags_id_seq'::regclass)" }, force: :cascade do |t|
    t.text "tagged_users", array: true
    t.integer "peep_id"
  end

  create_table "peeps", id: :serial, force: :cascade do |t|
    t.string "content", limit: 288
    t.integer "user_id"
    t.integer "peep_reply_id"
    t.integer "peep_tags_id"
    t.date "post_timestamp"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 30
    t.string "last_name", limit: 30
    t.string "username", limit: 30
    t.string "email", limit: 30
    t.string "hashed_password", limit: 30
    t.integer "writer_peep_id"
    t.integer "peep_reply_id"
  end

  add_foreign_key "peeps", "peep_replies", name: "peeps_peep_replies_id_fk"
  add_foreign_key "peeps", "peep_tags", column: "peep_tags_id", name: "peeps_tags_id_fk"
  add_foreign_key "users", "peep_replies", name: "users_peep_replies_id_fk"
  add_foreign_key "users", "peeps", column: "writer_peep_id", name: "users_peeps_id_fk"
end
