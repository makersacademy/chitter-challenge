require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chitter_test')
elsif ENV['RACK_ENV'] == 'production'
  DatabaseConnection.setup('drv62hqmjiq6b')
else
  DatabaseConnection.setup('chitter')
end
