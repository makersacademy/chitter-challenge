require 'pg'

class Peep
  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC;")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['peep'], time: peep['time']) 
    end
  end

  def self.post(peep:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep) VALUES($1) RETURNING id, peep, time;", [peep]
      )
    Peep.new(id: result[0]['id'], message: result[0]['peep'], time: result[0]['time'])
  end

end
