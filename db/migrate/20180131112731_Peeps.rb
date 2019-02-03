class Peeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.text :message, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_foreign_key :peeps, :users
  end
end

class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.timestamps
    end
  end
end
