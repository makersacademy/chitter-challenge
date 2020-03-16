require 'pg'

def setup_test_database 
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_challenge_test')
  connection.exec("TRUNCATE chitter;")
end 
