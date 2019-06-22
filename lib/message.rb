require './lib/database_connection.rb'

class Message

  def self.create(text:)
    message = DatabaseConnection.query("INSERT INTO messages(message) VALUES('#{text}') RETURNING id, message;")
    Message.new(id: message[0]['id'], text: message[0]['message'])
  end

  def self.all
    messages = DatabaseConnection.query("SELECT * FROM messages;")
    messages.map do |row| Message.new(id: row['id'], text: row['message']) end
  end

  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end
end
