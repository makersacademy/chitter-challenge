require 'pg'

class Peep
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY ID DESC")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'])
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep")
    
    result = connection.exec("SELECT * FROM peeps")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end
end
