require_relative 'database_connection'

class Message

  attr_reader :id, :content, :time, :user_name, :user_handle

  def initialize(id:, content:, time:, user_name:, user_handle:)
    @id = id
    @content = content
    @time = time
    @user_name = user_name
    @user_handle = user_handle
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map do |message|
      Message.new(id: message['id'],
        content: message['content'],
        time: message['time'],
        user_name: message['user_name'],
        user_handle: message['user_handle']
      )
    end
  end

  def self.create(content:, time: Time.now, user_name: 'default name', user_handle: 'default username')
    result = DatabaseConnection.query("INSERT INTO messages (content, time, user_name, user_handle)
    VALUES('#{content}', '#{time}', '#{user_name}', '#{user_handle}') RETURNING id, content, time, user_name, user_handle;")
    Message.new(id: result[0]['id'],
      content: result[0]['content'],
      time: result[0]['time'],
      user_name: result[0]['user_name'],
      user_handle: result[0]['user_handle']
    )
  end

end
