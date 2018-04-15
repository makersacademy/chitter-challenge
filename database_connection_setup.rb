require_relative './lib/database_connection'

if ENV['DATABASE'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end
