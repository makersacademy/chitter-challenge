require 'pg'

def setup_test_database
  p 'Setting up test database...'
  DBConnection.setup('chitter_test')
  DBConnection.query("TRUNCATE users, peeps;") # Reset before each test
end
