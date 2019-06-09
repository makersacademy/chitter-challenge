class AddUserIdToPeeps < ActiveRecord::Migration[5.2]
  def change
    add_column :peeps, :username, :string, null: false
  end
end
