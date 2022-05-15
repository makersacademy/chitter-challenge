require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('messages_test')
else
  DatabaseConnection.setup('messages')
end
