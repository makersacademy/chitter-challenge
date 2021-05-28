require './lib/database_connection.rb'

class Message

  attr_reader :text, :first_name, :id, :time_stamp

  def initialize(text, first_name, id, time_stamp)
    @text = text
    @first_name = first_name
    @id = id
    @time_stamp = time_stamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages")
    display = result.map do |message| 
      Message.new(message['text'], message['first_name'], message['id'], message['time_stamp'])
    end
    display.reverse
  end

  def self.create(text, first_name, time_stamp)
    result = DatabaseConnection.query("INSERT INTO messages (text, first_name, time_stamp) VALUES ('#{text}', '#{first_name}', '#{time_stamp}') RETURNING *")
    Message.new(result[0]['text'], result[0]['first_name'], result[0]['id'], result[0]['time_stamp'])
  end 

end