class ModifyPeeps < ActiveRecord::Migration[6.1]
  def up
    add_column :peeps, :user_id, :integer
    remove_column :peeps, :username
  end

  def down
    remove_column :peeps, :user_id
    add_column :peeps, :username, :string
  end
end
