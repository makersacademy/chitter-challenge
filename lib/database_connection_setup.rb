require_relative 'database_connection'
if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_app_test')
else
  DatabaseConnection.setup('chitter_app')
end
