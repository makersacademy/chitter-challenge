require_relative "database_connection"
require_relative "database_connection_setup"

require_relative "user"

class Message

  attr_reader :id, :text, :ts, :user_id
  def initialize(id:, text:, ts:, user_id:)
    @id = id
    @text = text
    @ts = ts
    @user_id = user_id
  end
  
  def self.create(user_id:, text:)
    ts = Time.now.strftime("%Y-%m-%d %H:%M:%S");
    result = DatabaseConnection.query("INSERT INTO messages (user_id, text, ts) VALUES ($1, $2, $3) RETURNING id, text, ts, user_id;", [user_id, text, ts])
    Message.new(id: result.first['id'], text: result.first['text'], ts: result.first['ts'], user_id: result.first['user_id'])
  end
  
  def self.where(user_id:)
    result = DatabaseConnection.query("SELECT * FROM messages WHERE user_id = $1;", [user_id])
    result.map { |post| Message.new(id: post['id'], text: post['text'], ts: post['ts'], user_id: post['user_id']) }.reverse
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM messages WHERE id = $1", [id])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM messages WHERE id = $1;", [id])
    Message.new(id: result.first['id'], text: result.first['text'], ts: result.first['ts'], user_id: result.first['user_id'])
  end

  def self.update(id:, text:)
    result = DatabaseConnection.query("UPDATE messages SET text = $1 WHERE id = $2 RETURNING id, text, ts, user_id;", [text, id])
    Message.new(id: result.first['id'], text: result.first['text'], ts: result.first['ts'], user_id: result.first['user_id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages")
    result.map { |post| Message.new(id: post['id'], text: post['text'], ts: post['ts'], user_id: User.find(id: post['user_id']).username.gsub(/(.)./, '\1*') ) }.reverse
  end

end