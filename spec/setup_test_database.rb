require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  # Clear the tables used in the program
  connection.exec("TRUNCATE peeps RESTART IDENTITY;")
  connection.exec("TRUNCATE users RESTART IDENTITY;")
end
