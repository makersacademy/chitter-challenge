require 'pg'
require_relative 'database_connection'

class Message
  def self.all
    rows = DatabaseConnection.query('SELECT * FROM messages')
    rows.map { |message| Message.new(message['content'], message['date_posted'], message['user_id']) }.reverse
  end

  def self.post(message)
    DatabaseConnection.query(
      "INSERT INTO messages (content, date_posted) VALUES('#{message}', NOW())"
    )
  end

  attr_reader :content, :time_posted, :date_posted, :user_id

  def initialize(content, date_posted, user_id)
    @content = content
    @time_posted = date_posted.split(' ').last.split('.').first[0, 5]
    @date_posted = date_posted.split(' ').first
    @user_id = user_id
  end
end
