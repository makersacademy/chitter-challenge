require 'pg'

class Peep

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id  = id
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec( "SELECT * FROM peeps;" )
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
  end

  def self.create(peep:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    result = conn.exec("INSERT INTO peeps(peep, time) VALUES('#{peep}', '#{Time.now.strftime("%I:%M on %d %B, %Y")}') RETURNING id, peep, time;")
      Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end
end
