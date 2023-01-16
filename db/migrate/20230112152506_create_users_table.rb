class CreateUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.text :name
      t.text :email
      t.text :password
    end
  end
end
