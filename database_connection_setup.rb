require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('peeps_test')
else
  DatabaseConnection.setup('peeps')
end
