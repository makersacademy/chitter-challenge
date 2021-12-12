require 'pg'

class Peeps
  attr_reader :peep, :id

  def initialize(peep:, id:)
    @peep = peep
    @id = id
  end

  def self.add(peep:)
    conn = PG.connect(dbname: 'chitter_test')
    result = conn.exec_params("INSERT INTO peeps (peep) VALUES ($1) RETURNING id, peep;", [peep])
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'])
  end
end

