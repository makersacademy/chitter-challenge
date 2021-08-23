require 'pg' #the gem makes object avaialbe to ruby

class Peep
  attr_reader :peep

  def initialize(peep:)
    @peep = peep
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter') #use PG to connect to database
    end

    result = connection.exec('SELECT * FROM peeps;') #can send query using exec to retrieve data
    result.map { |status| Peep.new(peep: status['peep']) } #return only the peeps in this loop
  end

  def self.create(peep)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end
  
    result = connection.exec("INSERT INTO peeps(peep) VALUES('#{peep}') RETURNING peep;")
    Peep.new(peep: result[0]['peep'])
  
  end 

end