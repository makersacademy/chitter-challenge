require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
  p "here"
else
  DatabaseConnection.setup('chitter_development')
  p "here2"
end