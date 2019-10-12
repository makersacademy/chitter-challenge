class AddTimestampsToPeeps < ActiveRecord::Migration[6.0]
  def change
    change_table :peeps do |t|
      t.timestamps
    end
  end
end
