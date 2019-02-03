class CreatePeeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.string :msg

      t.timestamps
    end
  end
end
