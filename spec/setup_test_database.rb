# in spec/setup_test_database.rb

def setup_test_database
  require 'pg'

  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the messages table
  connection.exec("TRUNCATE messages, users;")
end
