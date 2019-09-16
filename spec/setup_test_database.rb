require './lib/database_connection/'

def setup_test_database
  p "Exterminating content in all databases... / wiping hard drive..."
  #DatabaseConnection.setup(dbname: 'chitter_test')
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE chitter")
end
