require 'pg'

class Message
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'messages_test')
    else
      connection = PG.connect(dbname: 'messages')
    end
    
    result = connection.exec("SELECT * FROM messages;")
    result.map { |message| message['content'] }
  end

  def self.post(content)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'messages_test')
    else
      connection = PG.connect(dbname: 'messages')
    end
    
    if content != ""
      result = connection.exec("INSERT INTO messages (content) VALUES ('#{content}') RETURNING id, content;")
      result.first['content']
    end
  end
end