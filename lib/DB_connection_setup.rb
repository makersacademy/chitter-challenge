require_relative './db_connection.rb'

if ENV['RACK_ENV'] == 'test'
  DBconnection.setup('chitter_test')
else
  DBconnection.setup('chitter')
end
