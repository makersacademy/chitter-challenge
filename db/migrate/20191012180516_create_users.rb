class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :handle, limit: 100, unique: true
      t.string :name, limit: 100
      t.string :passhash
      t.timestamps
    end
  end
end
