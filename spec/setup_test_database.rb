require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'posted_peeps_test')
  p 'Creatig up test database...'
  connection.exec("TRUNCATE peeps;")
end