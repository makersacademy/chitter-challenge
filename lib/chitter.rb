require 'pg'

class Chitter

  attr_reader :id, :peep, :timestamp

  def initialize(id:, peep:, timestamp:)
    @id  = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec('SELECT * FROM chatter ')
    peeps.map { |latest| Chitter.new(id: latest['id'], peep: latest['peep'], timestamp: latest['timestamp'])}
  end

  def self.add(peep)
    time = self.time
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO chatter (peep, timestamp) VALUES('#{peep}', '#{time}') RETURNING id, peep, timestamp")
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'], timestamp: result[0]['timestamp'])
  end

  def self.time
    Time.now.strftime("%c")
  end

end
