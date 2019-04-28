require_relative 'database_connection'
require 'uri'

class Message
  attr_reader :id, :text, :post_time, :userid

  def initialize(id:, text:, post_time:, userid:)
    @id = id
    @text = text
    @post_time = post_time
    @userid = userid
  end

  def self.all

    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map do |message|
      Message.new(id: message['id'],
                  text: message['message'],
                  post_time: message['post_time'],
                  userid: message['userid'])
    end
  end

  def self.post(text:, userid:)
    result = DatabaseConnection.query("INSERT INTO
              messages (message, post_time, userid)
              VALUES('#{text}', '#{DateTime.now.strftime('%Y-%m-%d %I:%M:%S')}',
                '#{userid}' ) RETURNING id, message, post_time, userid;")

    Message.new(id: result[0]['id'], text: result[0]['message'],
           post_time: result[0]['post_time'], userid: result[0]['userid'])

  end

end
