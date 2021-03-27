require 'pg'

class Tweets 

  def self.all 
    connection = PG.connect(dbname: 'twitter')
    result = connection.exec("SELECT * FROM tweets;")
    result.map { |tweet| tweet['tweet'] }
  end

  def self.create(input)
    connection = PG.connect(dbname: 'twitter')
    connection.exec("INSERT INTO tweets (tweet) VALUES('#{input}') RETURNING id, tweet;")
  end 
end