require './lib/database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(ENV['TEST_SERVER'])
else
  DatabaseConnection.setup(ENV['PRODUCTION_SERVER'])
end