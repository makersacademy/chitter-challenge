require_relative './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chitter_manager_test')
else
  DatabaseConnection.setup('chitter_manager')
end
