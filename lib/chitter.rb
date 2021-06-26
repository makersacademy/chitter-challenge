require 'date'
require 'pg'
require './lib/database_connection.rb'

class Chitter
  attr_reader :tweet, :time

  def initialize(tweet:, time:)
    @tweet = tweet
    @time = time
  end

  def self.add(tweet:, time:)
    connect = PG.connect(dbname: 'chitter_test')
    connect = connect.exec("INSERT INTO tweets (tweet, time) VALUES ('#{tweet}', '#{time}') RETURNING tweet, time;")
    Chitter.new(tweet: connect[0]['tweet'], time: connect[0]['time'])
  end

  def self.all
    connect = PG.connect(dbname: 'chitter_test')
    chitter = connect.exec('SELECT * FROM tweets ORDER BY time DESC;')
    chitter.map do |tweet|
      Chitter.new(tweet: tweet['tweet'], time: tweet['time'])
    end
  end

  def self.time_of_tweet
    Time.new.strftime("%k:%M")
  end

end

