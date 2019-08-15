require 'pg'
class Chat


  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM messages;")
    result.map {|message| message['text']}
  end











end