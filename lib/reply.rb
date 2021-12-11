require_relative './database_connection'
require './lib/user'

class Reply
  attr_reader :id, :text, :created_at, :user_id, :username, :message_id

  def initialize(id:, text:, created_at:, user_id:, user: User, message_id:)
    @id = id
    @text = text
    @created_at = created_at
    @user_id = user_id
    @user = user
    @message_id = @message_id
    @user_id.nil? ? @username = 'Guest' : @username = user.find(@user_id).username
  end

  def self.all(order = "newest")
    result = DatabaseConnection.query("SELECT * FROM replies")
    replies = result.map do |reply|
      Reply.new(id: reply['id'], text: reply['text'], 
     created_at: format_time(reply['created_at']), user_id: result[0]['user_id'],
     message_id: result[0]['message_id'])
    end    
    order == "oldest" ? replies : replies.reverse 

  end

  def self.create(text:, user_id: 'null', message_id:)
    if user_id == 'null'
      result = DatabaseConnection.query(
        "INSERT INTO replies (text, created_at, message_id) VALUES($1, CURRENT_TIMESTAMP, $2) 
        RETURNING id, text, created_at, user_id, message_id", [text, message_id])
    else
      result = DatabaseConnection.query(
        "INSERT INTO replies (text, created_at, user_id, message_id) VALUES($1, CURRENT_TIMESTAMP, $2, $3) 
          RETURNING id, text, created_at, user_id, message_id", [text, user_id, message_id])
    end
    Reply.new(id: result[0]['id'], text: result[0]['text'], 
      created_at: format_time(result[0]['created_at']), user_id: result[0]['user_id'],
      message_id: result[0]['message_id'])
  end
end

private
  
def format_time(timestamp)
  Time.parse(timestamp).strftime("%H:%M %p %b' %d, %y")
end
