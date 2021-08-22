require 'pg'

def setup_test_database

  p 'Setting up test database...'

  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE users;")
  conn.exec("TRUNCATE posts;")
  # set up table id as well?
  
end