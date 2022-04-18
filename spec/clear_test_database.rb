require 'pg'

def clear_test_database
  puts 'Setting up test database...'
  connection = PG.connect(dbname: 'chitter_manager_test')

  # Clears the comments on the chitter_test table
  connection.exec("TRUNCATE messages, users;")
end
