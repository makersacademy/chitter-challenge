require 'pg'

class Chitter

  attr_reader :peep_id, :message, :timestamp

  def initialize(peep_id:, message:, timestamp:)
    @peep_id = peep_id
    @message = message
    @timestamp = timestamp
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps;')
    result.map do |peep| 
    Chitter.new(peep_id: peep['peep_id'], message: peep['message'], timestamp: peep['timestamp'])
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING peep_id, message, timestamp;")
    Chitter.new(peep_id: result[0]['peep_id'], message: result[0]['message'], timestamp: result[0]['timestamp'])
  end
  
end
