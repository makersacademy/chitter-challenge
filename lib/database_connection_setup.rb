require './lib/database_connection' 
 
if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('twitter_test')
else
  DatabaseConnection.setup('twitter')
end
