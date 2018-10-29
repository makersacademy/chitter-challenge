require 'pg'

class Message
  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM messages')
    result.map { |message| Message.new(id: message['id'],
      message: message['message'],
      time: message['time'])
    }.reverse
  end

  def self.create(message:, time:)
    message = DatabaseConnection.query("INSERT INTO messages (message, time)
      VALUES('#{message}', '#{time}')
      RETURNING id, message, time;"
    )
    Message.new(id: message[0]['id'],
      message: message[0]['message'],
      time: message[0]['time']
    )
  end
end
