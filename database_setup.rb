require_relative './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.connect 'chitter_test'
else
  DatabaseConnection.connect 'chitter'
end
