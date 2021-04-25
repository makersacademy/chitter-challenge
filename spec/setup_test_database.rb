require 'pg'

p 'setup_test_database found'
def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clear the test table(s)
  connection.exec('TRUNCATE peep;')
end
