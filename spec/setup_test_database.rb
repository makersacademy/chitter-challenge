require 'pg'

def setup_test_database
  puts 'Setting up test database...'

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users, messages;')
end
