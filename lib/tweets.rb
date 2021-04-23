require 'data_mapper'
require 'pg'

class Tweets

  attr_reader :tweet, :time

  def initialize(tweet, time)
    @tweet = tweet
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM tweets;")
    result.map { |entry| Tweets.new(entry["tweet"], entry["time"])}
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
    result.map { |entry| Tweets.new(entry["tweet"], entry["time"])}
  end
end