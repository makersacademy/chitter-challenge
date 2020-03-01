class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.string :body
      t.datetime :time_posted
      t.references :user, foreign_key: true
    end
  end
end