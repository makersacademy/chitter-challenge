require 'pg'

def setup_test_database
  p "Setting up Chitter's test database (peeps and users)..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users RESTART IDENTITY;")
end

def truncate_test_database
  p "Truncating Chitter's test database (both peeps and users)..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users RESTART IDENTITY;")
end

