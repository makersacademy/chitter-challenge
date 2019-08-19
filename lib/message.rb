require_relative 'database_connection'

class Message
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.reverse_each.map do |message| 
      Message.new(id: message['id'], text: message['text'], time: message['time'])
    end
  end

  def self.create(text:, time:)
    result = DatabaseConnection.query("INSERT INTO peeps (text, time) VALUES('#{text}', '#{time}') RETURNING id, text, time;")
    Message.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'])
  end

  attr_reader :id, :text, :time
  def initialize(id:, text:, time:)
      @id = id
      @text = text
      @time = time
  end
end
