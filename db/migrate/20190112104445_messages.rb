class Messages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.timestamps
      t.integer :user_id
    end
  end
end
