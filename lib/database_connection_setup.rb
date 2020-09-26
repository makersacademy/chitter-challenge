require_relative 'database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DBconnect.setup('chitter_test') 
else
  DBconnect.setup('chitter')
end