require 'pg'
p 'Setting up test database...'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users, peeps;')
end

def setup_test_database_peep
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE peeps;')
end
