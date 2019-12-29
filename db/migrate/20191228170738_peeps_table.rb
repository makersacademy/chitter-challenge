class PeepsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.references :user
      t.string :content, :limit => 60
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
