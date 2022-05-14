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
end