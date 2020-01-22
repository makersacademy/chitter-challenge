require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clean the peeps table
  connection.exec("TRUNCATE peeps, users;")
end
