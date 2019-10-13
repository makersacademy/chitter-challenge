class AddUserIdToPeeps < ActiveRecord::Migration[6.0]
  def change
    add_column(:peeps, :user_id, :integer)
    add_foreign_key(:peeps, :users, column: :user_id)
  end
end
