require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'peeps_test')
else
  DatabaseConnection.setup(dbname: 'peeps')
end
