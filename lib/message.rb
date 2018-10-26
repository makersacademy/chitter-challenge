require_relative 'database_connection'

class Message

  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map do |message|
      Message.new(id: message['id'],
        content: message['content'],
        time: message['time']
      )
    end
  end

  def self.create(content:, time: Time.now)
    result = DatabaseConnection.query("INSERT INTO messages (content, time)
    VALUES('#{content}', '#{time}') RETURNING id, content, time;")
    Message.new(id: result[0]['id'],
      content: result[0]['content'],
      time: result[0]['time']
    )
  end

end
