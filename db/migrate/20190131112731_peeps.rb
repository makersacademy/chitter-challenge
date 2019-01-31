class Peeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.text :message, null: false
      t.integer :user, null: false
      t.timestamps
    end
  end
end
