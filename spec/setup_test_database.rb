def setup_test_database
  require 'pg'
  p "Setting up test database..."
  #connect to test database
  con = PG.connect(dbname: 'chitter_test')
  #clear the peeps table
  con.exec("TRUNCATE peeps, replies, users;")
end
