require_relative './database_connection.rb'

class Message
  attr_reader :name, :username, :time, :text
  def initialize(name, username, time, text)
    @name = name
    @username = username
    @time = time
    @text = text
  end

  def self.get_messages
    result = DatabaseConnection.query("SELECT name, username, text, time FROM users u
    JOIN messages m
    ON u.id = m.users_id
    ORDER BY time DESC;")
    result.map { |message| Message.new(message['name'], message['username'], message['time'], message['text'])}
  end

  def self.display_messages
    get_messages.map { |message| "#{message.name} | #{message.username} | #{message.time} <br> #{message.text}" }.join("<br>")
  end
end