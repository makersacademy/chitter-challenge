require 'pg'

def setup_test_users
  p 'Setting up test users'
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE users;")
end

def setup_test_peeps
  p 'Setting up test peeps'
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE peeps;")
end
