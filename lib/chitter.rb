require_relative './database_connection'

class Chitter

  def self.post_peep(content:)
    result = DatabaseConnection.query("INSERT INTO messages (content) VALUES('#{content}') RETURNING id, content")
    Message.new(id: result[0]['id'], content: result[0]['content'])
  end
end

class Message

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end
end
