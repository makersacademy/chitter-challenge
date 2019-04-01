require_relative 'database_connection'
# require_relative 'user'

class Message

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map { |message|
      Message.new(
        id: message['id'],
        message: message['message'],
        time: message['time']
      )
    }.reverse
  end

  def self.post(message:)
    time = Time.new.strftime('%F  %H:%M:00')
    result = DatabaseConnection.query("INSERT INTO messages (message, time) VALUES ('#{message}', '#{time}') RETURNING id, message, time;")
    Message.new(
      id: result[0]['id'],
      message: result[0]['message'],
      time: result[0]['time']
    )
  end
end
