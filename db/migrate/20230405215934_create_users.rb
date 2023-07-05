class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :real_name, null: false
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
    end
  end
end
