class AddHandleAndEmailIndexesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
    add_index :users, :handle, unique: true
  end
end
