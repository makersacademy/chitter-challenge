require 'pg'

def clear_test_database
  p "Clearing test database..."
  connection = PG.connect(dbname: 'chitter_test_db')
  connection.exec("TRUNCATE messages;")
end