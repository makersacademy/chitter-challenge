class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |user|
      user.string :username
      user.string :email
      user.string :password
    end

    create_table :chirrups do |chirrup|
      chirrup.belongs_to :user, index: true
      chirrup.string :content
      chirrup.timestamps
    end
  end
end
