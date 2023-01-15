class Peeps < ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |t|
      t.string :content
      t.timestamp :time
      t.integer :user_id
    end
  end
end
