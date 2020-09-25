require 'pg'
class Peep

  def self.initialize(peep, time=Time.now.strftime('%Y-%m-%d-%H-%M'))
    @peep = peep
    @created_at = time
  end

  def self.set_environment
    if   ENV['ENVIRONMENT'] == "test"
        PG.connect(dbname: 'chitter_test')
    else
        PG.connect(dbname: 'chitter')
    end    
  end

  def self.all
    peeps = set_environment.exec("SELECT peep, time FROM peeps")
    peeps.map { |peep| Peep.new(peep['peep'], time)}
  end

  def self.add(peep, time=Time.now.strftime('%Y-%m-%d-%H-%M'))
    set_environment.exec("INSERT INTO peeps (peep, time) VALUES ('#{peep}', '#{time}')")
  end
end