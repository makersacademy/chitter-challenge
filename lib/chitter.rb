require 'date'
require 'pg'
require './lib/database_connection.rb'

class Chitter
  attr_reader :tweet, :time, :user_id

  def initialize(tweet:, time:, user_id:)
    @tweet = tweet
    @time = time
    @user_id = user_id
  end

  def self.add(tweet:, time:, user_id:)
    connect = PG.connect(dbname: 'chitter_test')
    connect = connect.exec("INSERT INTO tweets (tweet, time, user_id) VALUES ('#{tweet}', '#{time}', '#{user_id}') RETURNING tweet, time, user_id;")
    Chitter.new(tweet: connect[0]['tweet'], time: connect[0]['time'], user_id: connect[0]['user_id'])
  end

  def self.all(id:)
    connect = PG.connect(dbname: 'chitter_test')
    chitter = connect.exec("SELECT * FROM tweets WHERE user_id = #{id} ORDER BY time DESC;")
    chitter.map do |tweet|
      Chitter.new(tweet: tweet['tweet'], time: tweet['time'], user_id: tweet['user_id'])
    end
  end

  def self.view_all
    connect = PG.connect(dbname: 'chitter_test')
    chitter = connect.exec("SELECT * FROM tweets INNER JOIN users ON tweets.user_id = users.id ORDER BY user_id DESC LIMIT 10;")
    chitter.map do |tweet|
      Chitter.new(tweet: tweet['tweet'], time: tweet['time'], user_id: tweet['username'])
    end
  end

  def self.time_of_tweet
    Time.new.strftime("%k:%M")
  end

end

