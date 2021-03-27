require 'pg'
require_relative 'database_connection'

class Tweets 

  attr_reader :id, :tweet, :created_at

  def initialize(id:, tweet:, created_at:)
    @id = id 
    @tweet = tweet
    @created_at = created_at
  end 

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM tweets;")
    result.map do |input|
      Tweets.new(id: input['id'], tweet: input['tweet'], created_at: input['created_at'] ) 
    end
  end

  def self.create(tweet:)
    DatabaseConnection.query("INSERT INTO tweets (tweet) VALUES('#{tweet}') RETURNING id, tweet, created_at;")
  end 

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM tweets WHERE id = '#{id}';")
  end 
end