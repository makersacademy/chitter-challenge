require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_db_test')
else
  DatabaseConnection.setup('chitter_db')
end