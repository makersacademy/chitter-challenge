require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")

  connection.exec("TRUNCATE users;")
end