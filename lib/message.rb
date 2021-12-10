require_relative './database_connection'

class Message
  attr_reader :id, :text, :created_at

  def initialize(id:, text:, created_at:)
    @id = id
    @text = text
    @created_at = created_at
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages")
    result.map { |message| Message.new(id: message['id'], text: message['text'], created_at: format_time(message['created_at'])) }
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO messages (text, created_at) VALUES($1, CURRENT_TIMESTAMP) RETURNING id, text, created_at", [text])
    Message.new(id: result[0]['id'], text: result[0]['text'], created_at: format_time(result[0]['created_at']))
  end
end

private
  
def format_time(timestamp)
  Time.parse(timestamp).strftime("%H:%M %p %b' %d, %y")
end