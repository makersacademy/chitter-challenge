class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |table|
      table.string :name
      table.string :email
      table.string :username
      table.string :password_digest
    end
  end
end
