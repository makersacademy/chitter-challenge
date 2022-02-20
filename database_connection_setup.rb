require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chitter_test')
elsif ENV['RACK_ENV'] == 'production'
  DatabaseConnection.setup('')
else
  DatabaseConnection.setup('chitter')
end
