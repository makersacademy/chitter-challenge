class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t| # specifying name of the table
      t.string :username
      t.string :real_name
      t.string :password_digest # Passwords will be converted and stored in a hash
      t.string :email
    end
  end

end
