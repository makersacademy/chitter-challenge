require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clear the user and messages table
  connection.exec("TRUNCATE users;")
  connection.exec("TRUNCATE messages;")

end
