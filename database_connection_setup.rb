require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
elsif ENV['RACK_ENV'] == 'production'
  DatabaseConnection.remote_connection(ENV['DATABASE_URL'])
else
  DatabaseConnection.setup('chitter')
end
