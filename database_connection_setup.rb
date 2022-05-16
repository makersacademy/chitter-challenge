require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chitter_test')
elsif ENV['RACK_ENV'] == 'development'
  DatabaseConnection.setup('chitter')
else
end
