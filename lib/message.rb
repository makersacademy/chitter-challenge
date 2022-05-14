require 'pg'

class Message
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'messages_test')
    else
      connection = PG.connect(dbname: 'messages')
    end
    
    result = connection.exec("SELECT * FROM messages;")
    result.map { |message| Message.new(message['id'], message['content'], message['timestamp']) }
  end

  def self.post(content)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'messages_test')
    else
      connection = PG.connect(dbname: 'messages')
    end
    
    if content
      result = connection.exec("INSERT INTO messages (content) VALUES ('#{content}') RETURNING id, content, timestamp;")
      Message.new(result[0]['id'], result[0]['content'], result[0]['timestamp'])
    end
  end

  attr_reader :id, :content, :timestamp

  def initialize(id, content, timestamp)
    @id = id
    @content = content
    @timestamp = timestamp
  end

end