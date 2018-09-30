require './lib/database_connect'

if ENV['ENVIRONMENT'] == 'test'
  ConnectDatabase.setup('chitter_test')
else
  ConnectDatabase.setup('chitter')
end
