require 'pg'
require_relative '../lib/database_connection.rb'


def setup_test_database
  p "Setting up test database..."
  DatabaseConnection.setup('peep_manager_test')
  DatabaseConnection.query("TRUNCATE peeps;")
end
