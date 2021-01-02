require 'pg'
require 'database_connection'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE tweets, users;")
  DatabaseConnection.setup('chitter_test')
end
