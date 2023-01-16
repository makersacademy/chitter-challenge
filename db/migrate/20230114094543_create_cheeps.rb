class CreateCheeps < ActiveRecord::Migration[7.0]
  def change
    drop_table :cheeps, if_exists: true
    create_table :cheeps do |table|
      table.string :content,
      table.timestamps
    end
    add_reference :cheeps, :user, foreign_key: true
  end
end
