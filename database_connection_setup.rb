require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  Database_connection.setup('user_tweets_test')
else
  Database_connection.setup('user_tweets')
end
