require_relative 'database_connection'

class Peep
  attr_reader :id, :display_name, :peep, :time

  def initialize(id:, display_name:, peep:, time:)
    @id = id
    @display_name = display_name
    @peep = peep
    @time = time
  end

  def self.create(display_name, peep)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (display_name, peep) VALUES($1, $2) RETURNING id, display_name, peep, time;", [display_name, peep]
    )
    Peep.new(id: result[0]['id'], display_name: result[0]['display_name'], peep: result[0]['peep'], time: result[0]['time'])
  end
end