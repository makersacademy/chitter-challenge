class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :peep

      t.timestamps null: false
    end
  end
end
