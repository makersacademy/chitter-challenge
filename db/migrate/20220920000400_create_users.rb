class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |table|
      table.string :email
      table.string :password_digest
      table.string :name
      table.string :username
    end
  end
end
