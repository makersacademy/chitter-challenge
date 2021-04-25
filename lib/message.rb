require 'pg'
require_relative 'database_connection'

class Message
  attr_reader :text

  def initialize(text:)
    @text = text
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO messages (text) VALUES('#{text}') RETURNING text;")
    Message.new(text: result[0]['text'])

  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map { |message| Message.new(text: message['text']) }
  end
  
end