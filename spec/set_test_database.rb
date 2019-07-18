require 'pg'
require_relative '../models/database_connection'

p "Setting up test database..."

def set_test_database
  DatabaseConnection.setup('peep_manager_test')
  # connection = PG.connect(dbname: 'peep_manager_test')
  # Clear the peeps table
  DatabaseConnection.query("TRUNCATE peeps, users;")
  # connection.exec("TRUNCATE peeps, users;")
end

set_test_database