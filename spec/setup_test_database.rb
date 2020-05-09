require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'chitter-test')

  connection.exec("TRUNCATE peeps;")
end
