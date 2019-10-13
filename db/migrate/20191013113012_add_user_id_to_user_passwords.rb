class AddUserIdToUserPasswords < ActiveRecord::Migration[6.0]
  def change
    add_column(:user_passwords, :user_id, :integer)
    add_foreign_key(:user_passwords, :users, column: :user_id)
  end
end
