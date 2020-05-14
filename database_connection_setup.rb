require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('Chitter_Manager_test')
else
  DatabaseConnection.setup('Chitter_Manager')
end
