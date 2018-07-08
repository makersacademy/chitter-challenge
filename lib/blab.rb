require './lib/database_connection'

class Blab
  attr_reader :id, :timestamp, :content

  def initialize(id, timestamp, content)
    @id = id
    @timestamp = timestamp
    @content = content
  end

  def self.all
    result = DatabaseConnection.query("SELECT id, timestamp, content FROM blabs;")
    result.map do |blab|
      Blab.new(blab['id'], blab['timestamp'], blab['content'])
    end
  end

  def self.create(content)
    result = DatabaseConnection.query("INSERT INTO blabs (content) VALUES ('#{content}') RETURNING id, timestamp, content;")
    Blab.new(result.first['id'], result.first['timestamp'], result.first['content'])
  end

  def ==(blab)
    @id == blab.id
  end
end
