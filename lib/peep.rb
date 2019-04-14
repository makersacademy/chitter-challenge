require 'pg'
require_relative 'database_connection'
require 'date'
require 'time'

class Peep
  attr_reader :id, :content, :timestamp

  def initialize(id:, content:, timestamp:)
    @id = id
    @content = content
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY posted_at DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], timestamp: peep['posted_at'])
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (content) VALUES('#{content}') RETURNING id, content, posted_at")
    Peep.new(id: result[0]['id'], content: result[0]['content'], timestamp: result[0]['posted_at'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id}")
  end

  def self.update(id:, content:)
    result = DatabaseConnection.query("UPDATE peeps SET content = '#{content}' WHERE id = #{id} RETURNING id, content, posted_at")
    Peep.new(id: result[0]['id'], content: result[0]['content'], timestamp: result[0]['posted_at'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")
    Peep.new(id: result[0]['id'], content: result[0]['content'], timestamp: result[0]['posted_at'])
  end
end
