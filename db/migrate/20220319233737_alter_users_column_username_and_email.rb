class AlterUsersColumnUsernameAndEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :users, [:username, :email], unique: true
  end
end
