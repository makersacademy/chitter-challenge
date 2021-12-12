require './lib/database_connection'

# script: setting up the database connection

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_app_test')
else
  DatabaseConnection.setup('chitter_app')
end