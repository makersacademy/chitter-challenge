require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitters_manager_test')

  connection.exec("TRUNCATE chitters;")
end