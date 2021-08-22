require 'pg'

class Tweet
  attr_reader :id, :tweet, :time, :date

  def initialize(id:, tweet:, time: Time.now.strftime('%H:%M'), date: Time.now.strftime('%d/%m/%Y'))
    @id = id
    @tweet = tweet
    @time = time
    @date = date
  end

  def self.all
    connect_db
    tweets = @connection.exec('SELECT * FROM tweets').map do 
      |tweet| Tweet.new(id: tweet['id'], tweet: tweet['tweet'], time: tweet['time'], date: tweet['date'])
    end
  end

  def self.post(tweet:)
    connect_db
    result = @connection.exec_params('INSERT INTO tweets (tweet, time, date) VALUES ($1, $2, $3) RETURNING id, tweet, time, date;', [tweet, Time.now.strftime('%H:%M'), Time.now.strftime('%d/%m/%Y')])
    Tweet.new(id: result[0]['id'], tweet: result[0]['tweet'], time: result[0]['time'], date: result[0]['date'])
  end

  private

  def self.connect_db
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'twitter_clone_test')
    else
      @connection = PG.connect(dbname: 'twitter_clone')
    end
  end
end