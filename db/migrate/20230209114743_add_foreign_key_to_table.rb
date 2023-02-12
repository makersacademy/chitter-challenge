class AddForeignKeyToTable < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, on_delete: :cascade
    add_foreign_key :likes, :peeps, on_delete: :cascade
    add_foreign_key :peeps, :users, on_delete: :cascade
  end
end
