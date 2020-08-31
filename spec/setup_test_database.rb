require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clear peeps table to prepare for test
  connection.exec("TRUNCATE peeps, users;")
end