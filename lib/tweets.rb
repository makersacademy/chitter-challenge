require 'pg'
require_relative 'database_connection'

class Tweets 

  attr_reader :id, :tweet, :created_at, :created_by

  def initialize(id:, tweet:, created_at:, created_by:)
    @id = id 
    @tweet = tweet
    @created_at = created_at
    @created_by = created_by
  end 

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM tweets;")
    result.map do |input|
      Tweets.new(id: input['id'], tweet: input['tweet'], created_at: input['created_at'], created_by: input['created_by']) 
    end
  end

  def self.create(tweet:, created_by:)
    DatabaseConnection.query("INSERT INTO tweets (tweet, created_by) VALUES('#{tweet}', '#{created_by}') 
      RETURNING id, tweet, created_at, created_by;")
  end 

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM tweets WHERE id = '#{id}';")
  end 
end
