require 'pg'

class Message

  attr_reader :id, :peep, :timestamp

  def initialize(id:, peep:, timestamp:)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.all
    self.connection
    result = connection.exec("SELECT * FROM peeps ORDER BY timestamp DESC;")
    result.map { |peep|
      Message.new(
        id: peep['id'],
        peep: peep['peep'],
        timestamp: peep['timestamp']
      )}
  end

  def self.add(peep:)
    self.connection
    result = connection.exec("INSERT INTO peeps (peep, timestamp) VALUES('#{peep}', '#{DateTime.now}') RETURNING id, peep, timestamp;")
    Message.new(id: result[0]['id'], peep: result[0]['peep'], timestamp: result[0]['timestamp'])
  end

  private

  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end
  end
end
