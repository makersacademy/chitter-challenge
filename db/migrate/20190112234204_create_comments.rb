class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :peep, foreign_key: true
      t.timestamps
    end
  end
end
