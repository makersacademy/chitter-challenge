require_relative 'database_connection'

class Message

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map { |message| message['content'] }
  end

  def self.create(content:)
    DatabaseConnection.query("INSERT INTO messages (content) VALUES('#{content}');")
  end

end
