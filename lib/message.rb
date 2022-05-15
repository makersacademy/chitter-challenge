require 'pg'

class Message
  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map { |message| Message.new(message['id'], message['content'], message['timestamp']) }
  end

  def self.post(content)
    if content
      result = DatabaseConnection.query(
        "INSERT INTO messages (content) VALUES ($1) RETURNING id, content, timestamp;",
        [content]
      )
      Message.new(result[0]['id'], result[0]['content'], result[0]['timestamp'])
    end
  end

  attr_reader :id, :content, :timestamp

  def initialize(id, content, timestamp)
    @id = id
    @content = content
    @timestamp = timestamp
  end

end