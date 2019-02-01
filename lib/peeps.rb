require_relative 'database_connection'

class Peep
  
  attr_reader :id, :peep, :date, :time
  def initialize(id:, peep:, date:, time:)
    @id = id
    @peep = peep
    @date = date
    @time = time
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |peep| 
      Peep.new(
        id: peep['id'],
        peep: peep['peep'],
        date: peep['date'],
        time: peep['time']
      )
    end
  end

  def self.add(peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, date, time) VALUES('#{peep}', '#{DateTime.now.strftime("%d/%m/%Y")}', '#{DateTime.now.strftime("%I:%M%p")}') RETURNING id, peep, date, time;")
    Peep.new(id: result.first['id'], peep: result.first['peep'], date: result.first['date'], time: result.first['time'])
  end
end
