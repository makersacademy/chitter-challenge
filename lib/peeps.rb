require 'PG'
require_relative './database_connection'
require_relative './user'

class Peeps
  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.list
    Database.query( "SELECT * FROM peeps" ).map do | row |
      Peeps.new(id: row['id'], peep: row['peep'], time: row['time'])
    end
  end

  def self.add(peep:)
    result = Database.query( "INSERT INTO peeps(peep, time) VALUES('#{peep}', '#{DateTime.now}' ) RETURNING id, peep, time;")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

end
