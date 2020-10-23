require 'pg'

class Message

attr_reader :id, :message, :timestamp

  def initialize(id:, message:, timestamp:)
    @id  = id
    @message = message
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map do |message|
      Message.new(
        timestamp: message['timestamp'],
        message: message['message'],
        id: message['id']
      )
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO messages (message) VALUES('#{message}') RETURNING id, message, timestamp;")
    Message.new(id: result[0]['id'], message: result[0]['message'], timestamp: result[0]['timestamp'])
  end
end
