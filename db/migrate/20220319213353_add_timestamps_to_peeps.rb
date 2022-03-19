class AddTimestampsToPeeps < ActiveRecord::Migration[7.0]
  def change
    add_timestamps :peeps
  end
end
