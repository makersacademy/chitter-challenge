class ChangePasswordToPasswordHashInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column(:users, :password, :password_hash)
  end
end
