require 'data_mapper'
require 'pg'

class Tweets

  attr_reader :tweet

  def initialize(tweet)
    @tweet = tweet
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM tweets;")
    result.map { |entry| Tweets.new(entry["tweet"])}
  end

  def self.create(entry)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
      connection.exec("INSERT INTO tweets (tweet) VALUES('#{entry}')")
    end
end