class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |user|
      user.string :username
      user.string :email
      user.string :password
    end
  end
end
