require 'pg'

class Message

attr_reader :message

  def self.all
    connection = PG.connect(dbname: 'chitter_messages')
    result = connection.exec("SELECT * FROM messages;")
    result.map { |message| message['messages'] }
  end

  def self.create(text)
    @message = Message.new(text)
  end
end
