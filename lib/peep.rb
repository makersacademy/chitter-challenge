require 'database_connection'

class Peep
  
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.create_peep(peep:)
    result = DatabaseConnection.connection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

  def self.peeps
    result = DatabaseConnection.connection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'])
    end
  end
end
