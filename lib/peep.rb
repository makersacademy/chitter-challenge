require 'pg'
require 'time'
class Peep
  attr_reader :peep, :time

  def initialize(peep, time=Time.now)
    @peep = peep
    @time = Time.parse(time) if time.is_a? String
    @time = time if time.is_a? Time
  end

  def self.set_environment
    if   ENV['ENVIRONMENT'] == "test"
        PG.connect(dbname: 'chitter_test')
    else
        PG.connect(dbname: 'chitter')
    end    
  end

  def created_at 
    @time.strftime("%Y-%m-%d %H:%M:%S")
  end

  def self.all
    peeps = set_environment.exec("SELECT peep, time FROM peeps")
    peeps.map { |peep| Peep.new(peep['peep'], peep['time'])}
  end

  def self.add(peep, time=Time.now.strftime("%Y-%m-%d %H:%M:%S"))
    set_environment.exec("INSERT INTO peeps (peep, time) VALUES ('#{peep}', '#{time}')")
  end

  def format_date_from_timestamp
    @time.strftime('%d %b %Y')
  end

  def format_time_from_timestamp
    @time.strftime('%k:%M%P')
  end

  
end