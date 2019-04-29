require 'pg'

class Chitter
  attr_reader :id, :peep, :time
  def initialize(id: ,peep: ,time:)
    @id = id
    @peep = peep
    @time = time
  end

def self.all
  connection = PG.connect(dbname: 'chitter')
  r = connection.exec("SELECT * FROM chitter;")
  r.map {|peep|
      Chitter.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    }

    end

def self.create(peep:,time:)


  connection = PG.connect(dbname: 'chitter')
  connection.exec("INSERT INTO chitter (peep,time) VALUES('#{peep}','#{time}') RETURNING id, peep, time;")
  # Chitter.new(post: result[0]['peep'], time: result[0]['time'])
end



end
