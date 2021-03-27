require 'pg'

class Tweets 

  def self.all 
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'twitter_test')
    else
      connection = PG.connect(dbname: 'twitter')
    end
    result = connection.exec("SELECT * FROM tweets;")
    result.map { |input| input['tweet'] }
  end

  def self.create(tweet:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'twitter_test')
    else
      connection = PG.connect(dbname: 'twitter')
    end
    connection.exec("INSERT INTO tweets (tweet) VALUES('#{tweet}') RETURNING id, tweet;")
  end 
end