require_relative 'database_connection'

class Message
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.reverse_each.map do |message| 
    Message.new(id: message['id'], text: message['text'])
  end
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text;")
    Message.new(id: result[0]['id'], text: result[0]['text'])
  end

  attr_reader :id, :text
  def initialize(id:, text:)
      @id = id
      @text = text
      
  end
end
