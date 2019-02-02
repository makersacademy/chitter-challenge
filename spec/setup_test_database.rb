require 'pg'

def setup_test_database
  p "Setting up Chitter's test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end