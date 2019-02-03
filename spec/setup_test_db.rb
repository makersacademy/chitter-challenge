require 'pg'

def setup_test_db
  con = PG.connect :dbname => 'chitter_test'

  con.exec("TRUNCATE posts;")
  con.exec("TRUNCATE users;")
end
