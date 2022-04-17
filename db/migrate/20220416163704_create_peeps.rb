class CreatePeeps < ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |t|
      t.string :description
      t.datetime :created_at, null: false
    end
  end
end
