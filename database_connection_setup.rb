require './lib/databaseconnection.rb'

if ENV['ENVIRONMENT'] == 'test'
  Databaseconnection.setup('chitter_test')
else
  Databaseconnection.setup('chitter')
end
