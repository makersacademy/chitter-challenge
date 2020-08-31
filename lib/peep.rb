require 'pg'

class Peep

  attr_reader :id, :message, :timestamp

  def initialize(id:, message:, timestamp:)
    @id = id
    @message = message
    @timestamp = Time.parse(timestamp).strftime('%d-%m-%Y %H:%M:%S')
  end

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    peeps = connection.exec "SELECT * FROM peeps ORDER BY timestamp DESC"
    peeps.map { |peep| Peep.new(id: peep['id'], message: peep['message'], timestamp: peep['timestamp']) }
  end

  def self.create(message)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    result = connection.exec "INSERT INTO peeps (message) VALUES ('#{message}') RETURNING id, message, timestamp;"
    Peep.new(id: result[0]['id'], message: result[0]['message'], timestamp: result[0]['timestamp'])
  end

end
