require 'date'
require_relative 'database_connection'

class Messages
  attr_reader :text

  def initialize(id, text, time, user_id)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
  end

  def self.create(message_text, user_id)
    message_time = DateTime.now.strftime
    result = DatabaseConnection.query("INSERT INTO messages
      (message_text, message_time, user_id)
      VALUES ('#{message_text}', '#{message_time}', '#{user_id}')
      RETURNING id ")
    @message = Messages.new(result[0]['id'], message_text, message_time, user_id)
  end

  def self.instance
    @message
  end

  # def self.see_all
  #
  # end
end
