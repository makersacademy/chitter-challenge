require "pg"
require "./lib/db_connection"

def persisted_data(table:, id:)
  DBConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
