class Chitter
  attr_reader :id, :peep, :time

  def initialize(id: , peep: , time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.create(peep:)
    time1 = Time.now.strftime("%Y-%m-%d %H:%M")
    result = DatabaseConnection.query("INSERT INTO peeps(peep, time) VALUES($1, $2) RETURNING id, peep, time;", [peep, time1])
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC;", [])
    result.map do |peep| 
      Chitter.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
  end
end
