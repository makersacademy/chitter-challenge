class ForeignKeyUsersPeeps < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :peeps, :users
  end
end
