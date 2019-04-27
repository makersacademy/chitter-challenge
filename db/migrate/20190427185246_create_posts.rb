class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :post do |t|
      t.string :title
      t.string :content
      t.boolean :published, :default => false
      t.datetime :published_on, :required => false
      t.integer :likes, :default => 0
      t.timestamps null: false
    end
  end
end
