require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitterdb_test')
else
  DatabaseConnection.setup('chitterdb')
end
