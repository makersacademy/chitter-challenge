require 'pg'

class User
  def self.all
    # establishing the connection

    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'user_tweets_test')
                 else
                   PG.connect(dbname: 'user_tweets')
                 end
     result = connection.exec('SELECT * FROM tweet_info')
     result.map{|x| x['content'] }


  end
end
