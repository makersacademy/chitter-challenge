require 'pg'

def setup_test_users
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE users;")
end

def setup_test_peeps
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE peeps;")
end
