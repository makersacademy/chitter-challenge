require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :peep
  
  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

end