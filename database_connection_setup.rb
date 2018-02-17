require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default, 'postgres:///cheeter_test')
else
  DataMapper.setup(:default, 'postgres:///cheeter')
end
