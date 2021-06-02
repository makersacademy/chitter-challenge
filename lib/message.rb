require 'pg'
require_relative 'database_connection'

class Message
  attr_reader :text, :time, :date, :user_id

  def initialize(text:, time:, date:, user_id:)
    @text = text
    @time = time
    @date = date
    @user_id = user_id
  end

  def self.create(text:, user_id:)
    result = DatabaseConnection.query("INSERT INTO messages (text, user_id) VALUES('#{text}', '#{user_id}') RETURNING text, time, date, user_id;")
    Message.new(text: result[0]['text'], time: result[0]['time'], date: result[0]['date'], user_id: result[0]['user_id'])

  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map { |message| Message.new(text: message['text'], time: message['time'], date: message['date'], user_id: message['user_id']) }
  end

  def format_time
    time = Time.parse(@time.to_s)
    time.strftime("Posted at %H:PM %A")  
  end

end
