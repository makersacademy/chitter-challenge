require 'pg'

def setup_test_database
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE users; TRUNCATE peeps;")
end
