require 'pg'

def setup_test_database
  p 'Setting up test database for unit tests..'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE chitter_peeps;')  
  # clearing the table for each new unit-test run
end
