require_relative './database_connection'

class Peep
  attr_reader :id, :message, :timestamp

  def initialize(id: id, message: message, timestamp: timestamp)
    @id = id
    @message = message
    @timestamp = timestamp
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, timestamp;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], timestamp: Time.parse(result[0]['timestamp']))

  end
end