class CreatePeepsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |t|
      t.text :content
      t.timestamps
    end
  end
end
