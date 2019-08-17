require_relative 'database_connection'

class Message
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map {|message| message['text']}
    # Message.new(id: chitter['id'], text: chitter['text'])
  
  end

  attr_reader :id, :text
  def initialize(id:, text:)
      @id = id
      @text = text

  end
end