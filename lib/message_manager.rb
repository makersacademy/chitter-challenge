require_relative './database_connection'

class Message

  def self.post_peep(content:)
    result = DatabaseConnection.query("INSERT INTO messages \
      (content, timestamp) VALUES('#{content}', '#{Time.now}') \
      RETURNING id, content, timestamp")
    Message.new(id: result[0]['id'], content: result[0]['content'], \
      timestamp: result[0]['timestamp'])
  end

  def self.show_peeps
    result = DatabaseConnection.query("SELECT * FROM messages \
      ORDER BY timestamp DESC")
    result.map do |peep|
      Message.new(id: peep['id'], content: peep['content'], \
        timestamp: peep['timestamp'])
    end
  end

  attr_reader :id, :content, :timestamp

  def initialize(id:, content:, timestamp:)
    @id = id
    @content = content
    @timestamp = timestamp
  end
end
