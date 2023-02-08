class CreatePeeps < ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |t|
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
