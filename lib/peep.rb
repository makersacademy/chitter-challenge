require_relative 'database_connection'

class Peep

  attr_reader :id, :message, :timestamp

  def initialize(id:, message:, timestamp:)
    @id = id
    @message = message
    @timestamp = Time.parse(timestamp).strftime('%d-%m-%Y %H:%M:%S')
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY timestamp DESC")
    peeps.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], timestamp: peep['timestamp'])
    end
  end

  def self.create(message)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES ('#{message}')
    RETURNING id, message, timestamp;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], timestamp: result[0]['timestamp'])
  end

end
