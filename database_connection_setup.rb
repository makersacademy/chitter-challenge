require './lib/database_connection'

if ENV['CHITTER_CHALLENGE'] == 'TEST'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end
