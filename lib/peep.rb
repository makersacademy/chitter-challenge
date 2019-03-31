require_relative './database_connection'

class Peep
  attr_reader :id, :peep, :timestamp

  def initialize(id:, peep:, timestamp:)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.create(peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, timestamp;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], timestamp: Time.parse(result[0]['timestamp']))
  end

  def self.display
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], timestamp: peep['timestamp'])
    end
  end

end
