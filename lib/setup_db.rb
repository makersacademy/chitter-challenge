require_relative './database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup("bitter_test")
else
  DatabaseConnection.setup("bitter")
end
