require 'time'

class Peep
  attr_reader :id, :peep, :timestamp

  def initialize(id:, peep:, timestamp:)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.create(peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, timestamp;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], timestamp: Time.parse(result[0]['timestamp']) )
  end

  def self.all
   result = DatabaseConnection.query("SELECT * FROM peeps")
   result.map do |peep|
     Peep.new(
       peep: peep['peep'],
       timestamp: Time.parse(peep['timestamp']),
       id: peep['id']
     )
   end
  end
end
