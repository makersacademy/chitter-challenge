require './lib/database_connection'

if ENV['ENVIRONMNET'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end