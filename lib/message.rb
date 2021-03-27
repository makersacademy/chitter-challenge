require_relative 'db'

class Message
  attr_reader :id, :content, :created_at, :name, :username

  def initialize(id:, content:, created_at:, name:, username:)
    @id = id
    @content = content
    @created_at = created_at
    @name = name
    @username = username
  end
  
  def self.add(content, user_id)
    sql = "INSERT INTO messages (content, user_id) VALUES ('#{content}', #{user_id}) RETURNING id;"
    id = DB.query(sql)[0]['id']
    sql = "SELECT * FROM view_messages WHERE id='#{id}';"
    result = DB.query(sql)
    Message.new(id: result[0]['id'], content: result[0]['content'], created_at: result[0]['created_at'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.delete(id)
    sql = "DELETE FROM messages WHERE id = #{id};"
    DB.query(sql)
  end

  def self.all
    result = DB.query("SELECT * FROM view_messages ORDER BY created_at DESC;")
    result.map do |message|
      Message.new(id: message['id'], content: message['content'], created_at: message['created_at'], name: message['name'], username: message['username'])
    end
  end

  def self.find(id)
    sql = "SELECT * FROM view_messages WHERE id=#{id};"
    result = DB.query(sql)
    Message.new(id: result[0]['id'], content: result[0]['content'], created_at: result[0]['created_at'], name: result[0]['name'], username: result[0]['username'])
  end

  def tag(user_id)
    # sql = "INSERT INTO comments (text, bookmark_id) VALUES('#{text}', '#{@id}');"
    DB.query(sql)
  end
end
