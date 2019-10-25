require 'pg'

class Tweet
  attr_reader :tweet


  def initialize(tweet:)
    @tweet = tweet
  end

  def self.create(tweet:)
    connection = PG.connect(dbname: 'twitter_clone')
    result = connection.exec("INSERT INTO tweets (tweet) VALUES('#{tweet}')")
  #   Tweet.new(tweet: result[0]['tweet'])
  # end
  end

  def self.all
    connection = PG.connect(dbname: 'twitter_clone')
    tweets = connection.exec('SELECT * FROM tweets')
    tweets.map { |tweet| tweet['tweet'], tweet[''] }
  end

end
