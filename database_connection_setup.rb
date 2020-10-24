require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_manager_test')
else
  DatabaseConnection.setup('chitter_manager')
end
