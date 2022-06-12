require_relative './database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
  p true
else
  DatabaseConnection.setup('chitter')
end