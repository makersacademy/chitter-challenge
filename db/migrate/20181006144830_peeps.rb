class Peeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.string :peep
      t.string :time
      t.timestamps
    end
  end
end
