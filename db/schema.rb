ActiveRecord::Schema.define(version: 2020_04_19_114839) do

  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "username", null: false
  end

end
