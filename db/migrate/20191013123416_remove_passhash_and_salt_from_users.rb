class RemovePasshashAndSaltFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :passhash
    remove_column :users, :salt
  end
end
