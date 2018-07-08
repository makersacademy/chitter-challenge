require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('blabber_test')
else
  DatabaseConnection.setup('blabber')
end
