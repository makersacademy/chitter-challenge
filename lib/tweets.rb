require 'pg'
require_relative 'database_connection'

class Tweets 

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM tweets;")
    result.map { |input| input['tweet'] }
  end

  def self.create(tweet:)
    DatabaseConnection.query("INSERT INTO tweets (tweet) VALUES('#{tweet}') RETURNING id, tweet;")
  end 
end