require 'pg'

def setup
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE users;")
end
