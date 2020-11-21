require 'pg'

p 'Setting up test database...'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clear the table
  connection.exec('TRUNCATE peeps;')
end
