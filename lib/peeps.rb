require_relative 'database_connection'

class Peep
  
  attr_reader :id, :peep, :date
  def initialize(id:, peep:, date:)
    @id = id
    @peep = peep
    @date = date
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |peep| 
      Peep.new(
        id: peep['id'],
        peep: peep['peep'],
        date: peep['date']
      )
    end
  end

  def self.add(peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, date) VALUES('#{peep}', '#{DateTime.now.strftime("peeped on %d/%m/%Y at %I:%M%p")}') RETURNING id, peep, date;")
    Peep.new(id: result.first['id'], peep: result.first['peep'], date: result.first['date'])
  end
end
