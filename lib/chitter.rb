require 'db_connection'

class Chitter
  attr_reader :post, :timestamp

  def initialize(post:, timestamp:)
    @post = post
    @timestamp = timestamp
  end
    
  def self.create(post:, timestamp:)
    result = DatabaseConnection.query(
      "INSERT INTO chitter_posts (post, time) 
      VALUES ('#{post}', '#{timestamp}')
      RETURNING post, time"
    )
    Chitter.new(post: result[0]["post"], timestamp: result[0]["time"])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitter_posts")
    messages = result.map do |row| 
      Chitter.new(post: row["post"], timestamp: row["time"])
    end
    messages.reverse
  end

end
