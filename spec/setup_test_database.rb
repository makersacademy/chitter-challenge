require 'pg'

def setup_test_database
  p "connecting to database"
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE users;")
  # connection.exec("TRUNCATE posts;")
end
