require 'database_connection'

def setup_test_database
  DatabaseConnection.setup('peeps_manager_test')
  DatabaseConnection.query("TRUNCATE peeps, users;")
end
