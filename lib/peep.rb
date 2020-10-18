require 'pg'
require './lib/db_connection'
require 'time'

class Peep
  attr_reader :peep, :time, :id

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.add(peep:)
    result = DatabaseConnection.query("INSERT INTO chitter(peep, time) VALUES('#{peep}', '#{Time.now.strftime("%I:%M on %d %B, %Y")}' ) RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.all
    result = DatabaseConnection.query( "SELECT * FROM chitter" )
    result.map do |row| 
      Peep.new(id: row['id'], peep: row['peep'], time: row['time'])
    end
  end

end
