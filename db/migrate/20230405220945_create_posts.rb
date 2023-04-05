class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :content, null: false
      t.timestamps
    end
    add_reference(:posts, :user, foreign_key: { to_table: :users })

  end
end
