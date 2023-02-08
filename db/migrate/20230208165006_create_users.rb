class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, unique: true, null: false
      t.string :password, null: false
      t.string :username, unique: true, null: false

      t.timestamps null: false
    end
  end
end
