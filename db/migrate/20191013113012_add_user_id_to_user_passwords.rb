class AddUserIdToUserPasswords < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key(:user_passwords, :users)
  end
end
