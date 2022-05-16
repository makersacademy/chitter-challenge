require_relative '../lib/database_connection'

def setup_test_database
  require 'pg'

  p "Setting up test database..."

  connection = DatabaseConnection.setup('chitter_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE peeps;")
  
end
