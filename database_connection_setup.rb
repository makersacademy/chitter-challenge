require './lib/database_connection'

if ENV['ENVIROMENT'] = 'test'
  DatabaseConnection.setup('chitter_db_test')
else
  DatabaseConnection.setup('chitter_db')
end
