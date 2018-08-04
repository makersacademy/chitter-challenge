require 'pg'

class User
  attr_reader

  def initialize(content, timestamp)
  @timestamp  = timestamp
  @content = content
end

  def self.all
    # establishing the connection

    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'user_tweets_test')
                 else
                   PG.connect(dbname: 'user_tweets')
                 end
     result = connection.exec('SELECT * FROM tweet_info ORDER BY timestamp DESC')
     result.map{|post| post['content']}
  end

  def self.create_tweet(options)
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'user_tweets_test')
    else
    connection = PG.connect(dbname: 'user_tweets')
    end
    result = connection.exec("INSERT INTO  tweet_info(content) VALUES('#{options[:content]}') RETURNING content, timestamp")
    User.new(result.first['content'], result.first['timestamp'])
  end

end
