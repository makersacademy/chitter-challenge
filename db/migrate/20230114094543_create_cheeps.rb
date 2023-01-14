class CreateCheeps < ActiveRecord::Migration[7.0]
  def change
    create_table :cheeps do |table|
      table.string :content,
      table.timestamps
    end
  end
end
