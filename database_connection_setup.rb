require './lib/database_connection'

if ENV['CHITTER_ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_manager_test')
else
  DatabaseConnection.setup('chitter_manager')
end