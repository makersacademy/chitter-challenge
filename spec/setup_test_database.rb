require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Reset the test database
  connection.exec("TRUNCATE peeps, users;")
end
