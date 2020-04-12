class AddUserIdToPeeps < ActiveRecord::Migration[6.0]
  def change
    add_reference :peeps, :user, foreign_key: true
  end
end
