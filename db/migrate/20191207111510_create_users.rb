class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |user|
      user.string :name
      user.string :email
      user.string :username
      user.string :password
    end
  end
end
