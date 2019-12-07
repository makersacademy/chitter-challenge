class AddTimestampsToPeeps < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :peeps, null: true

    default_time = DateTime.new(1994, 1, 1)
    Peep.update_all(created_at: default_time, updated_at: default_time)

    change_column_null :peeps, :created_at, false
    change_column_null :peeps, :updated_at, false
  end
end
