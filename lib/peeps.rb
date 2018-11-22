require 'pg'

class Peep

  attr_reader :message, :timestamp

  def initialize(message:, timestamp:)
    @message = message
    @timestamp = timestamp
  end

  def self.post(message:, timestamp:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message, timestamp")
    p Peep.new( message: result[0]['message'], timestamp: result[0]['timestamp'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT message, timestamp FROM peeps")
    result.map do |peep|
    Peep.new(message: peep['message'], timestamp: peep['timestamp'])
    end
  end
end
