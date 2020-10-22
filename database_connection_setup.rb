require_relative 'lib/database_connection.rb'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end