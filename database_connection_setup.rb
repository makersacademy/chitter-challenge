require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'chitter_test')
else 
  DatabaseConnection.setup(dbname: 'chitter')
end