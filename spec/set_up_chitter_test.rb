require 'pg'

def set_up_chitter_test
  p 'setting up chitter...'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE messages;")
  connection.exec("TRUNCATE users;")
end
