require_relative 'database_connection'
require 'time'

class Peep
  
  attr_reader :id, :peep, :posted_time, :posted_by

  def initialize(id:, peep:, posted_time:, posted_by:)
    @id = id
    @peep = peep
    @posted_time = posted_time
    @posted_by = posted_by
  end

  def self.create_peep(peep:, posted_by:)
    time = Time.now
    current_time = time.strftime("%Y/%m/%d %k:%M")
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep, posted_time, posted_by)
      VALUES('#{peep}', '#{current_time}', '#{posted_by}')
      RETURNING id, peep, posted_time, posted_by"
    )
    Peep.new(
      id: result[0]['id'],
      peep: result[0]['peep'],
      posted_time: result[0]['posted_time'],
      posted_by: result[0]['posted_by']
    )
  end

  def self.peeps
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], posted_time: peep['posted_time'], posted_by: peep['posted_by'])
    end
  end
end
