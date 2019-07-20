# frozen_string_literal: true

# this is the peep class
class Peep
  attr_reader :id, :text, :timestamp
  
  def initialize(id:, text:, timestamp:)
    @id = id
    @text = text
    @timestamp = timestamp
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text, timestamp) VALUES ('#{text}', '#{Time.now}') RETURNING id, text, timestamp;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], timestamp: result[0]['timestamp'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC")
    result.map do |peep|
      Peep.new(
        text: peep['text'],
        id: peep['id'],
        timestamp: peep['timestamp']
      )
    end
  end
end
