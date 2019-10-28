require 'pg'

def setup_test_database
  p "Setting up database..."

  connection = PG.connect(dbname: 'chitter_test_database')

  connection.exec("TRUNCATE chitter;")
end
