require './lib/database_connection'

if ENV['ENVIRONMENT'] = 'test'
  DatabaseConnection.setup('peep_manager_test')
else
  DatabaseConnection.setup('peep_manager')
end
