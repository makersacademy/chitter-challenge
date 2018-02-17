require_relative 'database_connection'

class Peep

  attr_reader :peep, :time, :date

  def initialize(time, peep)
    @date = time[0..9]
    @time = time[11..15]
    @peep = peep
  end
    
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['time'],peep['peep']) }.reverse
  end
    
  def self.create(new_peep)
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{new_peep}');")  
  end
end
