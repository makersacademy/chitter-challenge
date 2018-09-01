require 'pg'

class Peep

  attr_reader :peep, :time

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC')

    result.map { |peep|
      Peep.new(peep['peep'], peep['time'])
    }
  end

  def self.create(peep)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    time = Time.new
    result = connection.exec("INSERT INTO peeps (peep, time) 
      VALUES ('#{peep}', '#{time}') RETURNING peep, time;")
    Peep.new(result[0]['peep'], result[0]['time'])
  end

  def initialize(peep, time)
    @peep = peep
    @time = time
  end

end
