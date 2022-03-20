require_relative 'database_connection'

class Peep
  attr_reader :id, :peep, :timestamp

  def initialize(id:, peep:, timestamp:)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC;")
    result.map do |message| 
      Peep.new(
        id: message['id'], 
        peep: message['peep'], 
        timestamp: message['created_at']
      ) 
    end
  end

  def self.post(peep:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep) VALUES($1) RETURNING id, peep, created_at", [peep]
    )
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], timestamp: result[0]['created_at'])
  end
end
