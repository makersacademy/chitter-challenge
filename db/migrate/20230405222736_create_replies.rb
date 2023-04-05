class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies 
    add_reference(:replies, :user, foreign_key: { to_table: :users })
    add_reference(:replies, :post, foreign_key: { to_table: :posts })
  end
end
