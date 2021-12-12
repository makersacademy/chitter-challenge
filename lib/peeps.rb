require 'pg'

class Peeps
  attr_reader :peep, :id

  def initialize(peep:, id:)
    @peep = peep
    @id = id
  end

  def self.add(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec_params("INSERT INTO peeps (peep) VALUES ($1) RETURNING id, peep;", [peep])
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'])
  end
end
