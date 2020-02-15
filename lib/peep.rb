require 'pg'
class Peep
  attr_reader :peep, :id
  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'chitter_test' )
    else 
      conn = PG.connect( dbname: 'chitter' )
    end 
    result = conn.exec( "SELECT * FROM peeps" )
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'])
    end
  end 


  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'chitter_test' )
    else 
      conn = PG.connect( dbname: 'chitter' )
    end 

    result = conn.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end 

end 