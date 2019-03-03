require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'makers_peeps_test')
  connection.exec("TRUNCATE peeps;")
end
