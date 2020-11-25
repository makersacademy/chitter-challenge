require 'pg'

class Peep
  attr_reader :peeps, :connection, :peep, :time, :date, :id

  def initialize(id:, peep:, time:, date:)
    @peep = peep
    @time = time
    @date = date
    @id = id
  end

  def self.all
    connect
    @peeps = @connection.exec("SELECT * FROM peeps ORDER BY time DESC;") 
    
    @peeps.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'], date: peep['date'])
    end
  end

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test') 
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.create(peep:)
    connect
    
    result = @connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, date, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], date: result[0]['date'], time: result[0]['time'] )

  end

end
