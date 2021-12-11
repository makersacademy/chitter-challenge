require_relative 'database_connection.rb'

class Peep 
  attr_reader :id, :message, :timestamp
  def initialize(id:,message:,timestamp:)
    @id = id
    @message = message
    @timestamp = timestamp
  end

  def self.create(message)
    current_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    result = DatabaseConnection.query("INSERT INTO peeps(message,timestamp) VALUES($1,$2) RETURNING id, message, timestamp;", [message,current_time])
    Peep.new(id: result[0]['id'], message: result[0]['message'], timestamp: result[0]['timestamp'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC;")
    result.map { |peep| Peep.new(id: peep['id'], message: peep['message'], timestamp: peep['timestamp']) }
  end

end