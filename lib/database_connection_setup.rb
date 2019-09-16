require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.set_up('honker_test')
else
  DatabaseConnection.set_up('honker')
end
