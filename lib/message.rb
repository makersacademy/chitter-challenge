require_relative 'database_connection'
require 'uri'

class Message
  attr_reader :id, :text, :post_time

  def initialize(id:, text:, post_time:)
    @id = id
    @text = text
    @post_time = post_time
  end

  def self.all

    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map do |message|
      Message.new(id: message['id'],
                   text: message['message'],
                   post_time: message['post_time'])
    end
  end

  def self.post(text:)

    result = DatabaseConnection.query("INSERT INTO messages (message, post_time)
                          VALUES('#{text}',
                          '#{DateTime.now.strftime('%Y-%m-%d %I:%M:%S')}')
                          RETURNING id, message, post_time;")

    Message.new(id: result[0]['id'], text: result[0]['message'],
           post_time: result[0]['post_time'])

  end

end
