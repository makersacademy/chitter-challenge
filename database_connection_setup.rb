require './lib/database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  # use below line if you'd like to run locally
  # DatabaseConnection.setup('chitter')
  DatabaseConnection.setup_production
end
