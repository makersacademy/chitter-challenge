class Users < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.stirng :name
      t.string :username
      t.string :email
      t.string :password_digest
    end
  end
end
