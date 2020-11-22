require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  # Clear the peeps table before each test
  connection.exec('TRUNCATE peeps;')
end
