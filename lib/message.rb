require_relative './database_connection'

class Message
  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages")
    result.map { |message| Message.new(id: message['id'], text: message['text']) }
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO messages (text) VALUES($1) RETURNING (id, text)", [text])
    Message.new(id: result[0]['id'], text: result[0]['text'])
  end
end