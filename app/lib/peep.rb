require 'pg'

class Peep
  attr_reader :peep, :id

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

    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        peep: peep['peep'], 
        id: peep['id']
      )
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id, peep")
    Peep.new(
      peep: result[0]['peep'],
      id: result[0]['id']
    )
  end
end