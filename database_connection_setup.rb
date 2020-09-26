require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('shore_test')
else
  DatabaseConnection.setup('shore')
end