class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.string :peep
      t.datetime :time_posted
      t.references :user
    end
  end
end
