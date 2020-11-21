require 'pg'
require_relative './database_connection'
class Peep
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitter")
    result.map { |peep|
      Peep.new(id: peep['id'], peep: peep['peep'])
    }
  end

  def self.peep(peep:)
    result = DatabaseConnection.query("INSERT INTO chitter (peep) VALUES('#{peep}') RETURNING id, peep;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end
end
