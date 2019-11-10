require 'pg'

class Peep

  attr_reader :peep, :time

  def initialize(peep:, time:)
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    results = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    results.map { |peep| 
      Peep.new(peep: peep['peep'], time: peep['time']) 
    }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    time = Time.now.strftime("%k:%M")
    result = connection.exec("INSERT INTO peeps (peep, time) 
    VALUES ('#{peep}', '#{time}') RETURNING peep, time")
    Peep.new(peep: result[0]['peep'], time: result[0]['time'])
  end

end
