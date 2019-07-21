require 'pg'
require './lib/database_connection'

def persisted_data(id:, table:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
