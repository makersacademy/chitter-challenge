require 'pg'

p "Running test database setup..."

def setup_test_database
  connection = PG.connect(dbname: "chitter_test")
  connection.exec("TRUNCATE peeps;")
end