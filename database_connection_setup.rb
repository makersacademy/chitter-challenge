require './lib/database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'chitter_test')
else
  DatabaseConnection.setup(dbname: 'chitter')
end
