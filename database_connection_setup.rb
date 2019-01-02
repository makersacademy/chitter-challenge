require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'Test'
  DatabaseConnection.setup('chitter_test')
elsif ENV['RACK_ENV'] == 'Production'
  DatabaseConnection.setup('dc95k2br607drq')
else
  DatabaseConnection.setup('chitter')
end
