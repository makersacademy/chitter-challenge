class AddPeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.string :content, limit: 140
    end
  end
end
