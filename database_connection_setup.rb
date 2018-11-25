require './lib/database_connection'

if ENV['TEST_DATABASE'] == 'chitter_test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end
