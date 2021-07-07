require 'pg'

class Peep 

  attr_reader :peep, :time_stamp

  def initialize(peep:, time_stamp:)
    @peep = peep
    @time_stamp = time_stamp
  end

  def self.create(peep:, time_stamp:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps(peep, time_stamp) VALUES ('#{peep}','#{time_stamp}') RETURNING peep, time_stamp;")
    Peep.new(peep: result[0]['peep'], time_stamp: result[0]['time_stamp'])
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT peep, time_stamp FROM peeps ORDER BY time_stamp DESC;')
    p result
    result.map do |hash|
      Peep.new(peep: hash['peep'], time_stamp: hash['time_stamp'])   
    end
  end

end