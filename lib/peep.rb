require 'pg'
require_relative './database_connection'

class Peep
  attr_reader :id, :content, :timestamp

  def initialize(id:, content:, timestamp:)
    @id = id
    @content = content
    @timestamp = timestamp
  end

  def self.all
    r = DatabaseConnection.query('SELECT * FROM peeps')
    r.map do |peep| Peep.new(id: peep['id'], content: peep['content'],
      timestamp: peep['timestamp'])
    end
  end

  def self.add(content:)
    r = DatabaseConnection.query("INSERT INTO peeps (content)
    VALUES ('#{content}') RETURNING id, content, timestamp;")
    Peep.new(id: r[0]['id'], content: r[0]['content'], timestamp: r[0]['timestamp'])
  end
end
