require 'pg'
require_relative '../models/database_connection'

p "Setting up test database..."

def set_test_database
  DatabaseConnection.setup('peep_manager_test')
  DatabaseConnection.query("TRUNCATE peeps, users;")
end

set_test_database