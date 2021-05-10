class CreatePeeps < ActiveRecord::Migration[6.1]
  def change
    create_table :peeps do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :peeps, [:user_id, :created_at]
  end
end
