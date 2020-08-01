require_relative 'database_connection'

class Peep
  attr_reader :text, :timestamp
  def initialize(text, timestamp)
    @text = text
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep| 
      Peep.new(peep['text'], peep['timestamp']) 
    end
  end

  def self.create(text)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text, timestamp) VALUES ('#{text}', current_timestamp) RETURNING *;"
    )
    Peep.new(
      result[0]['text'],
      result[0]['timestamp']
    )
  end
end
