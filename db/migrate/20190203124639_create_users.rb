class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, unique: true
      t.string :email, unique: true
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :username, unique: true
    # add_index :users, :username, unique: true, :email, unique: true
  end
end
