class AddTimestamps < ActiveRecord::Migration[6.0]
  def change
    change_table(:peeps) { |t| t.timestamps }
  end
end
