require 'pg'
def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clean the users table
  connection.exec("TRUNCATE users RESTART IDENTITY;")
end
