require './lib/database_connection'

if ENV['APP_ENV'] == 'test'
  DatabaseConnection.setup('chitter_test')
elsif ENV['APP_ENV'] == 'production'
  DatabaseConnection.setup('drv62hqmjiq6b')
else
  DatabaseConnection.setup('chitter')
end
