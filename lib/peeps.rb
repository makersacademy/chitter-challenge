require 'PG'
require_relative './database_connection'

class Peeps
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.list
    Database.query( "SELECT * FROM peeps" ).map do | row |
      Peeps.new(id: row['id'], peep: row['peep'])
    end
  end

  def self.add(peep:)
    result = Database.query( "INSERT INTO peeps(peep) VALUES('#{peep}' ) RETURNING id, peep;")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'])
  end

end
