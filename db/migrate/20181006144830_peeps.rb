class Peeps < ActiveRecord::Migration[5.2]
  def change
    create_table :peeps do |t|
      t.string :peep
      t.timestamps
      t.belongs_to :user, index: true
    end
    add_foreign_key :peeps, :users
  end
end
