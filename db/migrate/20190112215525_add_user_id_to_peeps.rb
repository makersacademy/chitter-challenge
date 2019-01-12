class AddUserIdToPeeps < ActiveRecord::Migration[5.2]
  def change
    add_column :peeps, :user_id, :integer
    add_index :peeps, :user_id
  end
end
