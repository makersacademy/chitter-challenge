class CreatePeeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.string :message, null: false, :limit => 140
    end
  end
end
