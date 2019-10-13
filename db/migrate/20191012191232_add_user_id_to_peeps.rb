class AddUserIdToPeeps < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key(:peeps, :users)
  end
end
