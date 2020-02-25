class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.string :content
      t.datetime :created_at
      t.references :user
    end
  end
end
