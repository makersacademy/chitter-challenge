require_relative 'database_connection'

class Peep

  attr_reader :id, :peep;

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| 
      Peep.new(
        peep: peep['peep'], 
        id: peep['id']
        ) }
  end

def self.create(peep:)
  result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES($1) RETURNING id, peep", [peep])
  Peep.new(id: result[0]['id'], peep: result[0]['peep'])
end

  def self.delete(id:)
    result = DatabaseConnection.query("DELETE FROM peeps WHERE id = $1", [id])
  end

  def self.update(id:, peep:)
    result = DatabaseConnection.query("UPDATE peeps SET peep = $1 WHERE id = $2 RETURNING id, peep;",
    [peep, id])
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = $1;",
    [id]
  )
  Peep.new(id: result[0]['id'], peep: result[0]['peep'])
end

end