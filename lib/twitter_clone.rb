require 'pg'

class Tweet
  attr_reader :id, :tweet, :time, :date

  def initialize(id:, tweet:)
    @id = id
    @tweet = tweet
    @time = Time.now.strftime('%H:%M')
    @date = Time.now.strftime('%d/%m/%Y')
  end

  # def self.all
  #   connect_db
  #   tweets = connection.exec('SELECT * FROM tweets').map do 
  #     |tweet| Tweet.new(tweet ['id'], tweet ['tweet'], tweet ['time'], tweet ['date'])
  #   end
  # end

  # def self.add(tweet:)
  #   connect_db
  #   result = connection.exec_params('INSERT INTO tweets (tweet, time, date) VALUES ($1, $2, $3) RETURNING id;', [tweet])
  #   Tweet.new(result[0]['id'], tweet)
  # end

  # private

  # def connect_db
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'twitter_clone_test')
  #   else
  #     connection = PG.connect(dbname: 'twitter_clone')
  #   end
  # end
end