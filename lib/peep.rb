require 'pg'
require './lib/db_connection'
require './db_connection_setup'

class Peep

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    result = DbConnection.query("SELECT * FROM peeps;")
    result.map { |entry| entry['peep'] }
  end

  def self.create(peep:)
    result = DbConnection.query("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id, peep;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

end
