require 'pg'

p 'Setting up databse...'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.exec("TRUNCATE chitter;")
end
