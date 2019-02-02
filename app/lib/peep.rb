require 'pg'

class Peep
  attr_reader :peep, :id

  def initialize(peep:, id:)
    @peep = peep
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.query("SELECT * FROM peeps")
    result.map { |peep| 
      Peep.new(peep: peep['peep'], id: peep['id'])
    }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep")
    Peep.new(peep: result[0]['peep'], id: result[0]['id'])

  end
end