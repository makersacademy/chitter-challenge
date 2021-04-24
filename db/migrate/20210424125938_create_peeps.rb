class CreatePeeps < ActiveRecord::Migration[6.1]
  def up
    create_table :peeps do |t|
      t.string :username
      t.string :status
    end
  end

  def down
    drop_table :peeps
  end
end
