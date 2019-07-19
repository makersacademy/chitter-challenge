require 'PG'
require_relative 'database_connection'


class Peep

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
  end

  def self.create(peep:, time:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time;")

    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])

  end
end
