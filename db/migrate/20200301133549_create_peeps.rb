class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end