require 'pg'
class Messages

  def self.all
    connection = PG.connect(dbname: 'Chitter')
    result = connection.exec("SELECT * FROM messages;")
    result.map {|message| message['messages']}
  end
end
