require 'pg'

class Message
  def self.all
    connection = PG.connect(dbname: 'messages')
    result = connection.exec("SELECT * FROM messages;")
    result.map { |message| message['content'] }
  end
end