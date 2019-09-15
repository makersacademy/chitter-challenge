require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'peeps_test')
  connection.exec("TRUNCATE peeps_library")
end
