require './lib/database_connection'

p ENV['ENVIRONMENT']

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'peeps_test')
else
  DatabaseConnection.setup(dbname: 'peeps')
end
