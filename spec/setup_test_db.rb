require 'pg'

def setup_chitter_test_database
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.exec("TRUNCATE peeps CASCADE;")
  connection.exec("TRUNCATE users CASCADE;")
end
