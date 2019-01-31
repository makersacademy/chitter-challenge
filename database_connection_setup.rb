require_relative './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('Chitter_Manager_Test')
else
  DatabaseConnection.setup('Chitter_Manager')
end
