require './lib/db_connection'

if ENV['Rack ENV'] == 'test'
  DBConnection.setup('chitter_test')
else
  DBConnection.setup('chitter')
end
