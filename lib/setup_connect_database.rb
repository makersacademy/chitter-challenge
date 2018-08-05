require './lib/connect_database'

if ENV['ENVIRONMENT'] == 'test'
  ConnectDatabase.setup('chitter_test')
else
  ConnectDatabase.setup('chitter')
end
