require 'pg'

class Peep

  attr_reader :id, :peep, :timestamp

  def initialize(id:, peep:, timestamp:)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "Chitter_Test")
    else
      connection = PG.connect(dbname: "Chitter")
    end

    peeps = connection.exec("SELECT * FROM peep ORDER BY timestamp DESC;")
    peeps.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], timestamp: peep['timestamp'])
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "Chitter_Test")
    else
      connection = PG.connect(dbname: "Chitter")
    end

    peep = connection.exec("INSERT INTO peep (peep) VALUES('#{peep}') RETURNING id, peep, timestamp;")
    Peep.new(id: peep[0]['id'], peep: peep[0]['peep'], timestamp: peep[0]['timestamp'])
  end
end
