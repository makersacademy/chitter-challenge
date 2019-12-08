class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.string :userid
      t.string :content
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
