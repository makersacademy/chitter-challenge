require './lib/db_connection'

if ENV['ENVIRONMENT'] == 'test'
  DBConnection.setup('chitter_test')
else
  DBConnection.setup('chitter') 
end
