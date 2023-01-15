class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.string :content
      t.timestamp :time
      t.integer :user_id
      t.integer :peep_id
    end

    add_foreign_key :replies, :users
    add_foreign_key :replies, :peeps
  end
end
