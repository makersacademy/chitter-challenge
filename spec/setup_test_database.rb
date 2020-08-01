require_relative '../lib/database_connection'

def setup_test_database
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE peeps RESTART IDENTITY")
end
