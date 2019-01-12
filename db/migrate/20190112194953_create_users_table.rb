class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |user|
      user.string :email
      user.string :password
      user.string :name
      user.string :username
    end
  end
end
