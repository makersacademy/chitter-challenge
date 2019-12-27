require 'pg'

def setup_test_database
  p 'Setting up test database...'

  DatabaseConnection.setup('chitter_test')

  #clear the bookmarks table
  DatabaseConnection.query("TRUNCATE peeps, users;")
end
