require 'pg'

def setup_test_database!
  p "cleaning database"

  connection = PG.connect(dbname: 'chitter_test')

  # clear the Messages table
  connection.exec("TRUNCATE users, messages;")
end
