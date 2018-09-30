require './app/models/database_connection'

p ENV['ENVIRONMENT']
if ENV['ENVIRONMENT'] == 'test'
  p 'chitter_test'
  DatabaseConnection.setup('chitter_test')
else
  p 'chitter'
  DatabaseConnection.setup('chitter')
end