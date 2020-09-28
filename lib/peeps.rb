require 'pg'

class Peeps 

  attr_reader :peep, :date

  def self.all
    set_environment
    result = @connection.exec("SELECT * FROM peeps;")
    peeps = result.map { |peep| Peeps.new(peep: peep['peep'], date: peep['date']) }
    peeps.reverse
  end

  def self.post(peep)
    set_environment
    now = Time.new 
    formatted = now.strftime("%d/%m/%Y")
    @connection.exec("INSERT INTO peeps (peep, date) VALUES ('#{peep}', '#{formatted}')")
  end 

  def initialize(peep:, date:)
    @peep = peep
    @date = date
  end 

private 

  def self.set_environment
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else 
      @connection = PG.connect(dbname: 'chitter')
    end 
  end 

end 
