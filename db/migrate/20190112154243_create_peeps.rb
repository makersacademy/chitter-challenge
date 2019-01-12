class CreatePeeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
