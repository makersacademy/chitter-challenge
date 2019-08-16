require './lib/databaseconnection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('peeps_test')
else
  DatabaseConnection.setup('peeps')
end
