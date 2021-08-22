class CreatePeeps < ActiveRecord::Migration[6.1]
  def change
    create_table :peeps do |t|
      t.string :body, null: false
      t.datetime :created_at, null: false
    end
  end
end
