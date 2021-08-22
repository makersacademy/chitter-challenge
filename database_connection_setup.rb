require './lib/dbconnect'

if ENV['RACK_ENV'] == 'test' 
  DBConnect.setup('chitter_test')
else
  DBConnect.setup('chitter')
end
