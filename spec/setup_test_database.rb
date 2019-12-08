require 'pg'

p "Setting up test database..."

def setup_test_database 
  connection = PG.connect(dbname: 'chitter_test')

  # Clear the messages table
  connection.exec("TRUNCATE TABLE messages, users;")
  # connection.exec("TRUNCATE users;")


end
