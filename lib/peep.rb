require 'pg'
<<<<<<< HEAD
require './lib/db_connection'
=======
require './lib/db_connection_setup.rb'
>>>>>>> 5412637bd88b0fe441dc3502b5a21226b6cf04ae

class Peep

  attr_reader :id, :peep

<<<<<<< HEAD
  def initialize(id: id, peep: peep)
=======
  def initialize(id:, peep:)
>>>>>>> 5412637bd88b0fe441dc3502b5a21226b6cf04ae
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
