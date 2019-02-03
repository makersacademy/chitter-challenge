require 'pg'
require 'time'
require_relative './database_connection'

class Peep
  attr_reader :peep, :id, :timestamp, :time

  def initialize(peep:, id:, timestamp:)
    @peep = peep
    @id = id
    @timestamp = timestamp
    @time = Time.parse(timestamp)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC;")
    result.map { |peep| 
      Peep.new(peep: peep['peep'], id: peep['id'], timestamp: peep['timestamp'])
    }
  end

  def self.create(peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, timestamp) VALUES('#{peep}', NOW()) RETURNING id, peep, timestamp;")
    Peep.new(peep: result[0]['peep'], id: result[0]['id'], timestamp: result[0]['timestamp'])
  end
end