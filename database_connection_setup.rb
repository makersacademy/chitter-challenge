require './app/models/database_connection'

p ENV['ENVIRONMENT']
if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end
