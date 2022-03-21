require './app/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup_db('chitter_app_test')
else
  DatabaseConnection.setup_db('chitter_app')
end
