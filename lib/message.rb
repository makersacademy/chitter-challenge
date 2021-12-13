require './lib/database_connection'

class Message
  attr_reader :id, :message, :created_at, :user_id

  @@current_time = Time.new.strftime("%H:%M")

  def initialize(id, message, created_at, user_id)
    @id = id
    @message = message
    @created_at = created_at
    @user_id = user_id
  end

  def self.add(message, posted_at = @@current_time, user_id)
    query = "INSERT INTO messages(post, created_at, user_id) 
    VALUES($1,$2,$3) RETURNING id, post, created_at, user_id;"
    DatabaseConnection.query(query, [message, posted_at, user_id])
  end

  def self.view_all
    posts = DatabaseConnection.query("SELECT * FROM messages ORDER BY id DESC;")
    posts.map { |post| Message.new(post['id'], post['post'], post['created_at'], post['user_id']) }
  end

  def user
    DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [user_id])
  end
end
