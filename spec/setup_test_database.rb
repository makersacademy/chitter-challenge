
require 'pg'

def setup_test_database
  
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_messenger_test')

  # Clear the messages table
  connection.exec("TRUNCATE messages;")
end