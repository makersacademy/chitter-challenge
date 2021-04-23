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
      connection.exec("INSERT INTO tweets (tweet, time) VALUES('#{entry}', '#{Time.now}')")
  end

  def self.reverse
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM tweets ORDER BY id DESC;")
    result.map { |entry| Tweets.new(entry["tweet"])}
  end
end