require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('squiggler_test')
else
  DatabaseConnection.setup('squiggler')
end
