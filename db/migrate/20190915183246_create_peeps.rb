class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |table|
      table.string :text
      table.timestamp :created_at, :null => false 
      table.references :user, foreign_key: true
    end
  end
end
