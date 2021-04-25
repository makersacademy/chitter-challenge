require 'pg'

class Peeps 
  attr_reader :peep, :time  
  def initialize(peep, time)
    @peep = peep
    @time = time
  end
  def self.all 
    con = PG.connect(dbname: choose_database)
    chitter = con.exec('SELECT * FROM peeps').map do |peeps|
     Peeps.new(peeps['peep'], peeps['time']) 
    end
  end

  def self.create(peep)
    con = PG.connect(dbname: choose_database)
    con.exec("INSERT INTO peeps (peep) VALUES('#{peep}')RETURNING peep, time")
    #Peeps.new(con[0]['peep'], con[0]['time'])
  end  

  def self.choose_database
    ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
  end

  def time_now
    time = Time.parse(@time.to_s)
    time.strftime("%I:%M %p")
  end
end  
