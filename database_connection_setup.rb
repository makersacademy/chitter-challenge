require_relative './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  p "test setup connection"
  DatabaseConnection.setup('chitter_test')
else
  p "normal setup connection"
  DatabaseConnection.setup('chitter')
end