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
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY ID DESC")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], timestamp: peep['timestamp'])
    end
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (peep, timestamp) VALUES('#{peep}', to_char(NOW(), 'HH24:MI:SS'))")
    
    result = connection.exec("SELECT * FROM peeps")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], timestamp: result[0]['timestamp'])
  end
end
