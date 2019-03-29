require 'pg'

def setup_test_database
  DatabaseConnection.query("TRUNCATE messages;")
  DatabaseConnection.query("TRUNCATE users;")
end
