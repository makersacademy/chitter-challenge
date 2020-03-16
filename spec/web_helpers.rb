require 'pg'

def clear_test_database
  p "Setting up the test database.."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE peeps;")
end
