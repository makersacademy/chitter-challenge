require 'pg'

p 'Setting up test database..'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_chatter_test')
  connection.exec("TRUNCATE peeps;")
end
