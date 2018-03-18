require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'production'
  DatabaseConnection.setup('chitter')
else
  DatabaseConnection.setup('chitter_test')
end
