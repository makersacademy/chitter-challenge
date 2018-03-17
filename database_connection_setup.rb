require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('blahblah_test')
else
  DatabaseConnection.setup('blahblah')
end
