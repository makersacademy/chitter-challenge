require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'chitter_web_test')
else
  DatabaseConnection.setup(dbname: 'chitter_web')
end
