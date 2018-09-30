require 'pg'
require './app/models/database_connection'

def clear_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')
  # Clear the peeps_data table
  connection.exec("TRUNCATE peeps_data, users")
end

def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end