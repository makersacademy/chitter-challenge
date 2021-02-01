require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_chatter_test')
else
  DatabaseConnection.setup('chitter_chatter')
end
