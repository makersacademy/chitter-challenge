require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'Chitter_Manager_test')
  connection.exec("TRUNCATE peeps;")
end
