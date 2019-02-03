require 'pg'
class Peep

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec( "SELECT * FROM peeps" )
    result.map { |row| Peep.new(id: row['id'], peep: row['peep']) }
  end

  def self.post(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec( "INSERT INTO peeps(peep) VALUES('#{peep}' ) RETURNING id, peep;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

end
