require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clear the peeps and users tables
  connection.exec("TRUNCATE peeps, users;")
end
