require 'pg'

class Peep
  attr_reader :peep, :peeptime, :id

  def self.create(peep, time = DateTime.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep, peeptime) VALUES ('#{peep}', '#{time.strftime("%k:%M:%S %d/%m/%Y")}') RETURNING id, peep, peeptime;")
    Peep.new(id: result[0]['id'],
                 peep: result[0]['peep'], 
                 peeptime: result[0]['peeptime'] )
    
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec( "SELECT * FROM peeps")
    result.map do |peep|
      self.new(id: peep["id"],
               peep: peep["peep"],
               peeptime: peep["peeptime"])
    end
  end

  def initialize(id:, peep:, peeptime:)
    @id = id
    @peep = peep
    @peeptime = peeptime
  end

end
