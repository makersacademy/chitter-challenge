require 'pg'
require 'database_connection'
require_relative '../lib/database_connection'

def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
