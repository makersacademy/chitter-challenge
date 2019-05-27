require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chit_test')
  connection.exec("TRUNCATE peeps RESTART IDENTITY;")
end