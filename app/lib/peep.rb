require 'pg'
require 'time'

class Peep
  attr_reader :peep, :id, :timestamp, :time

  def initialize(id:, peep:, timestamp:)
    @id = id
    @peep = peep
    @timestamp = timestamp
    @time = Time.parse(timestamp)
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC")
    result.map do |peep|
      Peep.new(
        peep: peep['peep'], 
        id: peep['id'],
        timestamp: peep['timestamp']
      )
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (peep, timestamp) VALUES ('#{peep}', NOW()) RETURNING id, peep, timestamp")
    Peep.new(
      peep: result[0]['peep'],
      id: result[0]['id'],
      timestamp: result[0]['timestamp']
    )
  end
end