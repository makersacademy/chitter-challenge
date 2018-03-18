require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(DB_TEST)
else
  DatabaseConnection.setup(DB_NAME)
end
