require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chitterweb_test')
else
  DatabaseConnection.setup('chitterweb')
end
