class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :text, limit: 280
      t.timestamps
      t.string :author_name
    end
  end
end
