class AddLoggedInStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :logged_in, :boolean, default: false
  end
end
