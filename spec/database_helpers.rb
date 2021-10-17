require "pg"
require "./lib/database_connection"

def persisted_data(id:, table:)
  connection = DatabaseConnection.setup("chitter_test")
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
