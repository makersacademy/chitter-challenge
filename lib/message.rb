require 'pg'

class Message
  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map { |message| Message.new(message['id'], message['content'], message['timestamp'], message['author']) }
  end

  def self.post(content, author='Anonymous')
    if content
      result = DatabaseConnection.query(
        "INSERT INTO messages (content, author) VALUES ($1, $2) RETURNING id, content, timestamp, author;",
        [content, author]
      )
      Message.new(result[0]['id'], result[0]['content'], result[0]['timestamp'], result[0]['author'])
    end
  end

  attr_reader :id, :content, :timestamp, :author

  def initialize(id, content, timestamp, author)
    @id = id
    @content = content
    @timestamp = timestamp
    @author = author
  end

end