require 'pg'
def setup_test_database!
  puts 'Setting up the test database'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users;')
end
