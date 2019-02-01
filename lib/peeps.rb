require 'PG'

class Peeps
  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      conn =  PG.connect( dbname: 'peep_manager_test' )
    else
      conn = PG.connect( dbname: 'peep_manager' )
    end
    conn.exec( "SELECT * FROM peeps" ).map do | row |
    Peeps.new(id: row['id'], peep: row['peep'])
  end
end

  def self.add(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      conn =  PG.connect( dbname: 'peep_manager_test' )
    else
      conn = PG.connect( dbname: 'peep_manager' )
    end
    result = conn.exec( "INSERT INTO peeps(peep) VALUES('#{peep}' ) RETURNING id, peep;")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'])
  end

end
