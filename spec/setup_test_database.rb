require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'messages_test')

  connection.exec("TRUNCATE messages, users;")
end
