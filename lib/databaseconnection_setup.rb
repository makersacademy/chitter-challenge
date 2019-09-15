require_relative './databaseconnection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DBcon.setup('chitter_test')
else
  DBcon.setup('chitter')
end
