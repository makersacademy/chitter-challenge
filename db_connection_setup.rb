require './lib/db_connection'

if ENV['ENVIRONMENT'] == 'test'
  DBConnection.setup('chitter_db_test')
else
  DBConnection.setup('chitter_bd')
end
