require 'pg'

class Peep
  def self.create(content:)
    time = Time.now
    result = DatabaseConnection.query(
      "INSERT INTO peeps (content, timestamp) VALUES($1, $2) RETURNING id, content, timestamp;",
      [content, time]
    )
    Peep.new(id: result[0]['id'], content: result[0]['content'], timestamp: result[0]['timestamp'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        timestamp: peep['timestamp']
      )
    end
  end

  attr_reader :id, :content, :timestamp

  def initialize(id:, content:, timestamp:)
    @id = id
    @content = content
    @timestamp = timestamp
  end
  
end
