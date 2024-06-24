require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clean the tables
  connection.exec("TRUNCATE users;")
end
