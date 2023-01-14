class MakeUnique < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :text, unique: true
    change_column :users, :username, :string, unique: true
  end
end
