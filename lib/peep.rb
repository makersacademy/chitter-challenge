require 'pg'

class Peep

  attr_reader :peep_id
  attr_accessor :peep

  def initialize(peep_id:, peep:)
     #created_on - may need later)
     @peep_id = peep_id
     @peep = peep
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING peep_id, peep;")
    Peep.new(peep_id: result[0]['peep_id'], peep: result[0]['peep'])
  end


end
