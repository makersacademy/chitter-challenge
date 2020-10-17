require 'pg'
require './lib/db_connection'

class Peep
  attr_reader :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.add(peep:)
    result = DatabaseConnection.query( "INSERT INTO chitter(peep, time) VALUES('#{peep}', '#{Time.now.strftime("%I:%M on %d %B, %Y")}' )")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

end
