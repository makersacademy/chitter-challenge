class Addcolumntochirrup < ActiveRecord::Migration[5.2]
  def change
    add_column :chirrups, :user_id, :integer
  end
end
