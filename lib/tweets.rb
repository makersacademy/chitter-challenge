require 'pg'
require_relative 'database_connection'

class Tweets 

  attr_reader :id, :tweet

  def initialize(id:, tweet:)
    @id = id 
    @tweet = tweet
  end 

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM tweets;")
    result.map do |input|
      Tweets.new(id: input['id'], tweet: input['tweet'] ) 
    end
  end

  def self.create(tweet:)
    DatabaseConnection.query("INSERT INTO tweets (tweet) VALUES('#{tweet}') RETURNING id, tweet;")
  end 

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM tweets WHERE id = '#{id}';")
  end 
end