class CreatePeeps < ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |t|
      t.text :content
      t.string :tagged_users
      t.timestamps # Automatically creates created_at and updated_at columns
      t.integer :user_id
    end
    
  end
end
