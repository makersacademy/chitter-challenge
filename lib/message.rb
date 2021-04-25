require 'pg'
require_relative 'database_connection'

class Message
  attr_reader :text, :time, :date

  def initialize(text:, time:, date:)
    @text = text
    @time = time
    @date = date
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO messages (text) VALUES('#{text}') RETURNING text, time, date;")
    Message.new(text: result[0]['text'], time: result[0]['time'], date: result[0]['date'])

  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map { |message| Message.new(text: message['text'], time: message['time'], date: message['date']) }
  end
  
end