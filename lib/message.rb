require 'pg'
require './lib/database_connection'

class Message

  attr_reader :id, :date_time, :message

  def initialize(id:, date_time:, message:)
    @id = id
    @date_time = date_time
    @message = message
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages ORDER BY timestamp DESC")
    result.map do |message|
      Message.new(
        id: message['id'],
        date_time: message['timestamp'],
        message: message['message']
      )
    end

  end

  def self.create(message:)
    result = DatabaseConnection.query(
      # "INSERT INTO messages (date_time, message) VALUES($1, $2) RETURNING id;",
      # [date_time.to_s, message]
      "INSERT INTO messages (message) VALUES($1) RETURNING id, message, timestamp;",
      [message]
    )
    Message.new(id: result[0]['id'], date_time: result[0]['timestamp'], message: result[0]['message'])
  end

  def self.delete(id:)
    DatabaseConnection.query(
      "DELETE FROM messages WHERE id = $1", [id] 
    )
  end

  def self.find(id:)
    result = DatabaseConnection.query(
      "SELECT * FROM messages WHERE id = $1", [id]
    )
    Message.new(id: result[0]['id'], date_time: result[0]['timestamp'], message: result[0]['message'])
  end

  def self.update(id:, message:)
    result = DatabaseConnection.query(
      "UPDATE messages SET message = $2 WHERE id = $1 RETURNING id, timestamp, message;", [id, message]
    )
    Message.new(id: result[0]['id'], date_time: result[0]['timestamp'], message: result[0]['message'])
  end


end