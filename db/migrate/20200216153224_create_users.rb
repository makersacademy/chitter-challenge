class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |u|
      u.string :username, :unique => true
      u.string :email, :unique => true
      u.string :name
    end
  end
end
