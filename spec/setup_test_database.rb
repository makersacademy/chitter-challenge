require 'pg'

def setup_test_database
  
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the bookmarks table and the users table
  connection.exec("TRUNCATE peeps, users;")
end