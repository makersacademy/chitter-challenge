class RemoveLikesFromPeepsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :peeps, :likes, :integer
  end
end
