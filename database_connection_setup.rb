require './lib/database_connection'

if ENV['RACK_TEST'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end