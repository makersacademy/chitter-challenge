require 'time'
require_relative './database_connection'

class Peep
  attr_reader :peep, :id, :timestamp

  def initialize(peep:, id:, timestamp:)
    @peep = peep
    @id = id
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query(
      "SELECT * FROM peeps 
      ORDER BY id DESC;"
      )
    result.map { |peep| 
      Peep.new(
        peep: peep['peep'], 
        id: peep['id'], 
        timestamp: peep['timestamp']
        )
    }
  end

  def self.create(peep:)
    clean_peep = sanitize_peep(peep)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep, timestamp) 
      VALUES('#{clean_peep}', NOW()) 
      RETURNING id, peep, timestamp;"
      )
    Peep.new(
      peep: result[0]['peep'], 
      id: result[0]['id'], 
      timestamp: result[0]['timestamp']
      )
  end

  def formatted_date
    time = Time.parse(@timestamp)
    time.strftime("%d %B, %Y")
  end

  def formatted_time
    time = Time.parse(@timestamp)
    time.strftime("%k%M")
  end
end
