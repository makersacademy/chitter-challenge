class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :comments
      t.string :tags
      t.integer :user_id
      t.timestamps
    end
  end
end
