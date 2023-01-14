class CreateForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_column :peeps, :user_id, :bigint

    add_foreign_key :peeps, :users
  end
end
