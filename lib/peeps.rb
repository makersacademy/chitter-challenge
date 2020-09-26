require 'pg'

class Peeps 

  def self.all
    set_environment
    result = @connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end

  def self.post(peep)
    set_environment
    @connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}')")
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
