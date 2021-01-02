require './lib/db_connection'

class Message
  attr_reader :id, :content, :created_at, :user_id

  def initialize(id:, content:, created_at:, user_id:)
    @id = id
    @content = content
    @created_at = created_at
    @user_id = user_id
  end
  
  def self.all
    result = DBConnection.query("SELECT id, content, to_char(created_at, 'Mon DD, YYYY HH24:MI'), user_id FROM messages ORDER BY created_at DESC")
    result.map do |message|
      Message.new(id: message['id'], content: message['content'], created_at: message['to_char'], user_id: message['user_id'])
    end
  end

  def self.create(content, user_id)
    return nil if content.chars.count > 240 
    result = DBConnection.query("INSERT INTO messages(content, user_id) VALUES($$#{content}$$, '#{user_id}') RETURNING id, content, created_at")
    Message.new(id:result[0]['id'], content:result[0]['content'], created_at:result[0]['created_at'], user_id:result[0]['user_id'])
  end

  def self.edit(id, content)
    result = DBConnection.query("UPDATE messages SET content='#{content}' where id=#{id} returning id, content, created_at, user_id")
    Message.new(id:result[0]['id'], content:result[0]['content'], created_at:result[0]['created_at'], user_id:result[0]['user_id'])
  end

  def self.delete(id)
    DBConnection.query("DELETE FROM messages WHERE id=#{id}")
  end

  def name(user_id)
    DBConnection.query("SELECT name FROM users WHERE id='#{user_id}'")[0]['name']
  end

  def username(user_id)
    DBConnection.query("SELECT username FROM users WHERE id='#{user_id}'")[0]['username']
  end

  def self.find(id)
    result = DBConnection.query("SELECT * FROM messages where id=#{id}")
    Message.new(id:result[0]['id'], content:result[0]['content'], created_at:result[0]['created_at'], user_id:result[0]['user_id'])
  end
end