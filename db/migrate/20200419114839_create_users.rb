class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false
      t.string :encrypted_password, null: false
      t.string :username,           null: false
    end
  end
end
