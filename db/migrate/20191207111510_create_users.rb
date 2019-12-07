class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |user|
      user.string :username
      user.string :password
      user.string :email
    end
  end
end
