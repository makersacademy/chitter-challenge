require './lib/database_connection'

class Message
  attr_reader :id, :message, :created_at

  @@current_time = Time.new.strftime("%H:%M")

  def initialize(id, message, created_at)
    @id = id
    @message = message
    @created_at = created_at
  end

  def self.add(message, posted_at = @@current_time)
    query = "INSERT INTO messages(post, created_at) VALUES($1,$2);"
    DatabaseConnection.query(query, [message, posted_at])
  end

  def self.view_all
    posts = DatabaseConnection.query("SELECT * FROM messages ORDER BY id DESC;")
    posts.map { |post| Message.new(post['id'], post['post'], post['created_at']) }
  end
end
