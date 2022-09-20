class RenameAuthorToUserId < ActiveRecord::Migration[7.0]
  def change
    remove_column :peeps, :author_name

    add_column :peeps, :user_id, :bigint

    add_foreign_key :peeps, :users
  end
end
