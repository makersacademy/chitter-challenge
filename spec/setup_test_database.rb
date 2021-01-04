require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the table
  connection.exec("TRUNCATE users, peeps;")
end
