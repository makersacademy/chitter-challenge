require 'time'
require_relative './database_connection'
require_relative './peeptime'

class Peep

  attr_reader :id, :message, :timestamp

  def initialize(id:, message:, timestamp:)
    @id  = id
    @message = message
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        timestamp: peep['timestamp']
      )
    end
  end

  def self.create(message:, timestamp:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (message, timestamp)
       VALUES('#{message}', NOW())
       RETURNING id, message, timestamp"
     )
    Peep.new(
      id: result[0]['id'],
      message: result[0]['message'],
      timestamp: result[0]['timestamp']
    )
  end

  def formatted_date
    PeepTime.formatted_date(@timestamp)
  end

  def formatted_time
    PeepTime.formatted_time(@timestamp)
  end

end
