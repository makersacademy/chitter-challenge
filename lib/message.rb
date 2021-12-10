require './lib/database_connection'

class Message
  attr_reader :id, :message

  def initialize(id, message)
    @id = id
    @message = message
  end

  def self.add(message)
    DatabaseConnection.query("INSERT INTO messages(post) VALUES($1);", [message])
    # posts.map { |post| Message.new(post['id'], post['message']) }
  end

  def self.view_all
    posts = DatabaseConnection.query("SELECT * FROM messages;")
    posts.map { |post| Message.new(post['id'], post['post']) }
  end
end
