require './lib/db_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  connection = DbConnection.setup('chitter_test')
else
  connection = DbConnection.setup('chitter')
end
