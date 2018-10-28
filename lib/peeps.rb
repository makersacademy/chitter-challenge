require 'pg'

class Peeps

  def initialize(peep, time)
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM chitter;") #need to change this to chitter in both test and otherwise
    result.map{|peep| Peeps.new(peep['peep'], peep['time'])
      "#{peep['peep'] } -- #{peep['time']}"
    }
  end

  def self.create(peep:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO chitter (peep, time) VALUES('#{peep}', NOW())")
  end

end
