require 'pg'
require '././setup_db_connection'

def setup_test_database
  setup
  DatabaseConnection.query("TRUNCATE peeps, users RESTART IDENTITY;")
end
