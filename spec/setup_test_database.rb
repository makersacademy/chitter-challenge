require 'pg'

p "Setting up test database..."

def setup_test_database
  # Connect to test database
  connection = PG.connect(dbname: 'message_manager_test')
  # Clear the messages table
  connection.exec("TRUNCATE messages, users;")
end