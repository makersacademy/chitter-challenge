require 'pg'

def setup_test_database # similar function to a before each in rspec
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE users, peeps;")
end
