class ChangeLikesToLuvs < ActiveRecord::Migration[6.0]
  def change
    rename_table :likes, :luvs
  end
end
