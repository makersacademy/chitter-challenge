require 'pg'

class Chitter

  attr_reader :tweet, :date, :username

  def initialize(tweet, date, username = "@ChitChat")
    @date = date
    @tweet = tweet
    @username = username
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec "SELECT * FROM chitters;"
    mapped = result.map do |chitter|
      Chitter.new(chitter['tweet'], chitter['date'])
    end
  end

  def self.create(tweet)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO chitters (username, tweet, date) VALUES($1, $2, $3) RETURNING id, username, tweet, date;", ["@ChitChat", tweet, Date.today])
    Chitter.new(result[0]['tweet'], result[0]['date'])
  end

end
