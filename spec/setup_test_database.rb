require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE users CASCADE;")
  connection.exec("TRUNCATE peeps CASCADE;")
  connection.exec("TRUNCATE user_tags CASCADE;")
end
