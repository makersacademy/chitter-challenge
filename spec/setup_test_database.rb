require './lib/database_connection.rb'

def setup_test_database
  p "Setting up test database..."
  DatabaseConnection.setup(dbname: 'chitter_test')
  DatabaseConnection.query("TRUNCATE messages;")
end
