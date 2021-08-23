require './lib/database_connection'

if ENV['RACK_ENV'] = 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end
