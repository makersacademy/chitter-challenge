require 'pg'

class Peep

  attr_reader :message, :timestamp

  def initialize(message:, timestamp:)
    @message = message
    @timestamp = timestamp
  end

  def self.post(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message")
    p Peep.new(message: result[0]['message'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
    Peep.new(message: peep['message'], timestamp: peep['timestamp'])
    end
  end
end
