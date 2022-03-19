require_relative 'database_connection'

class Peep
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |message| Peep.new(id: message['id'], peep: message['peep']) }
  end

  def self.post(peep:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep) VALUES($1) RETURNING id, peep;", [peep]
    )
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end
end
