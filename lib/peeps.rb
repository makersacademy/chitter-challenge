
class Peeps 
  attr_reader :peep
  
  def initialize
    @peep = peep
  end
  def self.all 
    con = PG.connect(dbname: choose_database)
    chitter = con.exec('SELECT * FROM peeps')
    chitter.map {|peeps| peeps['peep']}
  end

  def self.create(peep)
    con = PG.connect(dbname: choose_database)
    con.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end  

  def self.choose_database
    ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
  end
  
end