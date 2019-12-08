require 'pg'

def db_test_setup
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_db_test')
  connection.exec("TRUNCATE chitter;")
end