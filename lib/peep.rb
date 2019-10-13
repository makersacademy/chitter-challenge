require_relative 'database_connection'

class Peep

  attr_reader :id, :time, :peep

  def initialize(id:, time:, peep:)
    @id  = id
    @time = time
    @peep = peep
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |a_peep|
      Peep.new(id: a_peep['id'], time: a_peep['time'], peep: a_peep['peep'])
    end
  end

  def self.create(peep:)
    time = Time.now
    #return false if(peep).empty?
    result = DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], time: result[0]['time'], peep: result[0]['peep'])
  end
end
