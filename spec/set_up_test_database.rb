require 'pg'

def set_up_test_database!
  p "Setting up test database..."
  connection = PG.connect(dbname: 'user_tweets_test')
  connection.exec("TRUNCATE tweet_info;")
end
