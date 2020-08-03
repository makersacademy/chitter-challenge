class Message

  def initialize(id:, user_id:, content:, time:)
    @id = id
    @user_id = user_id
    @content = content
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map do |message| 
      Message.new(id: message['id'], user_id: message['user_id'], content: message['content'], time: message['time'])
    end
  end

  def self.create(user_id:, content:)
    result = DatabaseConnection.query("INSERT INTO messages (user_id, content) VALUES('#{user_id}', '#{content}') 
    RETURNING id, user_id, content, time;")
    Message.new(id: result[0]['id'], user_id: result[0]['user_id'], content: result[0]['content'], time: result[0]['time'])
  end
end
