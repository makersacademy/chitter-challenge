require 'pg'

class Message

  def self.all
    con = PG.connect(dbname: 'chitter')
    result = con.exec("SELECT * FROM messages")
    result.map { |message| message['text'] }
  end
end