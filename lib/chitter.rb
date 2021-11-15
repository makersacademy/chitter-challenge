require 'pg'

class Chitter

  attr_reader :tweet, :date, :username

  def initialize(tweet, username = "@ChitChat")
    @date = Date.today
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
    result.map do |chitter|
      Chitter.new(chitter['tweet'])
    end
  end

  def self.create(tweet)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO chitters (username, tweet, date) VALUES($1, $2, $3) RETURNING id, username, tweet, date;", ["@ChitChat", tweet, Date.today])
    Chitter.new(result[0]['tweet'])
  end

end
