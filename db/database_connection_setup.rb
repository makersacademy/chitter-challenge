require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('Chitter_test')
else
  DatabaseConnection.setup('Chitter')
end

