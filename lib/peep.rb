require 'pg'
require_relative 'db_connection'

class Peep

  attr_reader :id, :peep, :peeper

  def initialize(id:, peep:, peeper:)
    @id = id
    @peep = peep
    @peeper = peeper
  end

  def self.create(peep)    
    result = DbConnection.query("INSERT INTO peeps(peep, peeper) VALUES('#{peep}', 'none') RETURNING id, peep, peeper;")
    Peep.new(
      id: result[0]['id'], 
      peep: result[0]['peep'], 
      peeper: result[0]['url']
    )
  end

  def self.all
    result = DbConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['peep'] }
  end

end