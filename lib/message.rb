require 'pg'
require './lib/database_connection.rb'

class Message

  attr_reader :text, :user_name, :id, :time_stamp

  def initialize(text, user_name, id, time_stamp)
    @text = text
    @user_name = user_name
    @id = id
    @time_stamp = time_stamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages")
    display = result.map do |message| 
      Message.new(message['text'], message['user_name'], message['id'], message['time_stamp'])
    end
    display.reverse
  end

  def self.create(text, user_name, time_stamp)
    result = DatabaseConnection.query("INSERT INTO messages (text, user_name, time_stamp) VALUES ('#{text}', '#{user_name}', '#{time_stamp}') RETURNING *")
    Message.new(result[0]['text'], result[0]['user_name'], result[0]['id'], result[0]['time_stamp'])
  end 

end