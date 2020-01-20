require 'pg'

class Peep

  attr_reader :peep, :time

  def initialize(peep, time)
    @peep = peep
    @time = time
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')

    result.map { |peep| self.new(peep['peep'], peep['time']) }
  end

  def self.add(peep)
    time = Time.now.strftime("%k:%M")
    DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES('#{peep}','#{time}')")
  end

end