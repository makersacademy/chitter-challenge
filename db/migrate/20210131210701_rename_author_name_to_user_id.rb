class RenameAuthorNameToUserId < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :author_name
    add_column :posts, :user_id, :bigint
    add_foreign_key :posts, :users
  end
end
