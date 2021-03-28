require_relative 'db'
require_relative 'user'

class Message
  attr_reader :id, :content, :created_at, :name, :username

  def initialize(id:, content:, created_at:, user_id:, name:, username:)
    @id = id
    @content = content
    @created_at = created_at
    @user_id = user_id
    @name = name
    @username = username
  end
  
  def self.add(content, user_id)
    content = content.gsub("'", "''")
    sql = "INSERT INTO messages (content, user_id) VALUES ('#{content}', #{user_id}) RETURNING id;"
    id = DB.query(sql)[0]['id']
    sql = "SELECT * FROM view_messages WHERE id='#{id}';"
    result = DB.query(sql)
    Message.new(id: result[0]['id'], content: result[0]['content'], created_at: result[0]['created_at'], user_id: result[0]['user_id'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.all
    result = DB.query("SELECT * FROM view_messages ORDER BY created_at DESC;")
    result.map do |message|
      Message.new(id: message['id'], content: message['content'], created_at: message['created_at'], user_id: message['user_id'], name: message['name'], username: message['username'])
    end
  end

  def tagged_user_emails
    emails = []
    User.all.each do |user|
      emails << user.email if @content.include? "@#{user.username}"
    end
    emails
  end
end
