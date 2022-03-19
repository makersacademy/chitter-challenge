require 'pg'
require_relative './database_connection'

class Peep
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps;')
    peeps.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'])
    end
  end

  def self.create(peep:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep) VALUES($1) RETURNING id, peep;", [peep]
      )
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end
end
