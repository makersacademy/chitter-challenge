require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('cheeter_development_test')
else
  DatabaseConnection.setup('cheeter_development')
end
