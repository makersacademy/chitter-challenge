require "pg"
require "./lib/db_connection"

def pd(table:, id:)
  DBConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
