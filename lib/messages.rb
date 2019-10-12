require 'date'
require_relative 'database_connection'

class Messages
  attr_reader :text, :time, :user_id, :user

  def initialize(id:, text:, time:, user_id:, user:)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
    @user = user
  end

  def self.create(message_text, user)
    message_time = DateTime.now
    result = DatabaseConnection.query("INSERT INTO messages
      (message_text, message_time, user_id)
      VALUES ('#{message_text}', '#{message_time.strftime}', '#{user.id}')
      RETURNING id ")
    @message = Messages.new(
      id: result[0]['id'],
      text: message_text,
      time: message_time.strftime("%m/%d/%Y at %I:%M%p"),
      user_id: user.id, user: user.name)
  end

  def self.instance
    @message
  end

  def self.show_all
    result = DatabaseConnection.query("SELECT * FROM messages ORDER BY message_time DESC;")
    result.map do |message|
      user = DatabaseConnection.query("SELECT name FROM users WHERE id = #{message['user_id']};")
      Messages.new(
        id: message['id'],
        text: message['message_text'],
        time: message['message_time'],
        user_id: message['user_id'],
        user: user[0]['name'])
    end
  end
end
