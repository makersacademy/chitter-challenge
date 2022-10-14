class Peeps < ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |t|
      t.text :content
      t.timestamps null: false
      t.integer :user_id
    end
  end
end
