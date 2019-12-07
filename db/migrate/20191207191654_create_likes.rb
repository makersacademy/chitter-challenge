class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |like|
      like.integer :user_id
      like.integer :peep_id
    end
  end
end
