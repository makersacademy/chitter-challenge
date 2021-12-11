require_relative './database_connection'
require './lib/user'

class Message
  attr_reader :id, :text, :created_at, :user_id, :username

  def initialize(id:, text:, created_at:, user_id:, username: User)
    @id = id
    @text = text
    @created_at = created_at
    @user_id = user_id
    @user_id == nil ? @username = 'Guest' : @username = User.find(@user_id).username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages")
    result.map { |message| Message.new(id: message['id'], text: message['text'], created_at: format_time(message['created_at']), user_id: result[0]['user_id']) }
  end

  def self.create(text:, user_id: 'null')
    if user_id == 'null'
      result = DatabaseConnection.query("INSERT INTO messages (text, created_at) VALUES($1, CURRENT_TIMESTAMP) RETURNING id, text, created_at, user_id", [text])
    else
      result = DatabaseConnection.query("INSERT INTO messages (text, created_at, user_id) VALUES($1, CURRENT_TIMESTAMP, $2) RETURNING id, text, created_at, user_id", [text, user_id])
    end
    Message.new(id: result[0]['id'], text: result[0]['text'], created_at: format_time(result[0]['created_at']), user_id: result[0]['user_id'])
  end
end

private
  
def format_time(timestamp)
  Time.parse(timestamp).strftime("%H:%M %p %b' %d, %y")
end