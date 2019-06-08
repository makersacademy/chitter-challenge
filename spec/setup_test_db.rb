require 'pg'

def setup_test_db
  puts "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_test')
  # Clear messages table
  connection.exec("TRUNCATE peeps, users;")
end
