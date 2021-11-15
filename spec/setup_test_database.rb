require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  # Clear the test tables
  connection.exec("TRUNCATE chitters;")
  connection.exec("TRUNCATE accounts;")
end
