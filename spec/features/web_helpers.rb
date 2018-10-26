require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitterdb_test')

  connection.exec("TRUNCATE messages;")
  connection.exec("TRUNCATE users;")
end