require_relative 'database_connection'
require 'time'

class Peep
  
  attr_reader :id, :peep, :posted_time

  def initialize(id:, peep:, posted_time:)
    @id = id
    @peep = peep
    @posted_time = posted_time
  end

  def self.create_peep(peep:)
    time = Time.now
    current_time = time.strftime("%Y/%m/%d %k:%M")
    result = DatabaseConnection.connection.query(
      "INSERT INTO peeps (peep, posted_time)
      VALUES('#{peep}', '#{current_time}')
      RETURNING id, peep, posted_time"
    )
    Peep.new(
      id: result[0]['id'],
      peep: result[0]['peep'],
      posted_time: result[0]['posted_time']
    )
  end

  def self.peeps
    result = DatabaseConnection.connection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], posted_time: peep['posted_time'])
    end
  end
end
