require_relative 'database_connection'

class Cheet
  attr_reader :content, :id, :timestamp

  def initialize(id:, content:, timestamp:)
    @content = content
    @id = id
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM cheets;")
    result.map do |cheet|
      Cheet.new(id: cheet['id'], content: cheet['content'], timestamp: cheet['timestamp'])
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO cheets (content) VALUES ('#{content}') RETURNING id, content, timestamp;")
    Cheet.new(id: result[0]['id'], content: result[0]['content'], timestamp: result[0]['timestamp'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM cheets WHERE id=#{id};")
    Cheet.new(id: result['id'], content: result['content'], timestamp: result['timestamp'])
  end

end
