require 'pg'
def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE users CASCADE;")
end