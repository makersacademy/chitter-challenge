require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chitter_test')
  # DatabaseConnection.setup('users_test')
else
  DatabaseConnection.setup('chitter')
  # DatabaseConnection.setup('users')
end
