require 'pg'

def setup_test_database
  p "Setting up test database..."
  # connnect to the test database
  connection = PG.connect(dbname: 'chitter_app_test')
  # clear the database
  connection.exec('TRUNCATE peeps;')
end