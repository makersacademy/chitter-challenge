require 'pg'

def setup_test_database
  p "test database..."
  connection = PG.connect(dbname: 'chit_test')
  connection.exec("TRUNCATE peeps, users RESTART IDENTITY;")
end
