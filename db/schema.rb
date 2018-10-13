ActiveRecord::Schema.define(version: 2018_10_06_144830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "peeps", force: :cascade do |t|
    t.string "peep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_peeps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "name"
    t.string "password"
  end

  add_foreign_key "peeps", "users"
end
