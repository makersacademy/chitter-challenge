require_relative '../lib/database_connection'

def setup_test_database
  p "Setting up test database..."
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE peeps RESTART IDENTITY")
end
