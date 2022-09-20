class CreatePeeps < ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |table|
      table.text :text
      table.string :author_name
      table.timestamps
    end
  end
end
