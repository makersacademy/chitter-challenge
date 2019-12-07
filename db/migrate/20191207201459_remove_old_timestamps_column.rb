class RemoveOldTimestampsColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :peeps, :timestamp, :datetime
  end
end
