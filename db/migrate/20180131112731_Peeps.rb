
class Peeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.text :message, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_foreign_key :peeps, :users
  end
end
