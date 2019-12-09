class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.integer :user_id
      t.string :content
    end
  end
end
