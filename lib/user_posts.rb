require './lib/database_connection'

class User
  attr_reader

  def initialize(content, timestamp)
    @timestamp = timestamp
    @content = content
end

  def self.all
    # establishing the connection
    result = Database_connection.query('SELECT * FROM tweet_info ORDER BY timestamp DESC')
    result.map { |post| post['content'] }
  end

  def self.create(options)
    Database_connection.query("INSERT INTO  tweet_info(content) VALUES('#{options[:content]}') RETURNING content, timestamp")
  end

end
