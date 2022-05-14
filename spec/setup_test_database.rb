require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'messages_test')

  # Clear the messages table
  connection.exec("TRUNCATE messages;")
end