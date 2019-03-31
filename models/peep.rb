require 'pg'

class Peep

  attr_reader :id, :timestamp, :message

  def initialize(id:, timestamp:, message:)
    @id = id
    @timestamp = timestamp
    @message = message
  end

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end
    
    result = connection.exec("SELECT * FROM peep_messages ORDER BY timestamp DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], timestamp: peep['timestamp'])
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("INSERT INTO peep_messages (message) VALUES('#{message}') RETURNING id, timestamp, message;")
    Peep.new(id: result[0]['id'], timestamp: result[0]['timestamp'], message: result[0]['message'])
  end

end