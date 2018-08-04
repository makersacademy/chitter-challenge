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

  def self.create_tweet(options)
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'user_tweets_test')
    else
    connection = PG.connect(dbname: 'user_tweets')
    end
    connection.exec("INSERT INTO tweet_info(content) VALUES('#{options[:content]}')")
  end

end
