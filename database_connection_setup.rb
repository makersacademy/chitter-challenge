require_relative 'lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  p 'Setting database as test database...'
  DatabaseConnection.setup('chitter_test')
else
  p 'Setting database as development database...'
  DatabaseConnection.setup('chitter')
end
