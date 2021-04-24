require 'pg'

class Message
  attr_reader :text

  def initialize(text:)
    @text = text
  end

  def self.create(text:)
    connection = PG.connect(dbname: "chitter_test")
    result = connection.exec("INSERT INTO messages (text) VALUES('#{text}') RETURNING text;")
    Message.new(text: result[0]['text'])

  end

  def self.all
    connection = PG.connect(dbname: "chitter_test")
    result = connection.exec("SELECT * FROM messages;")
    result.map { |message| Message.new(text: message['text']) }
  end
  
end