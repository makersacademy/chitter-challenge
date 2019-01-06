require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'Test'
  DatabaseConnection.setup('chitter_test')
elsif ENV['RACK_ENV'] == 'Production'
  DatabaseConnection.setup(ENV['DATABASE_URI'])
else
  DatabaseConnection.setup('chitter')
end
