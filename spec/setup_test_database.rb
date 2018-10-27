require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clears the peeps table
  connection.exec("TRUNCATE peeps;")

  # Clears the users table
  connection.exec("TRUNCATE users;")
end
