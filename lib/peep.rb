require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test', user: 'postgres', password: 'postgres')
    else 
      connection = PG.connect(dbname: 'chitter', user: 'postgres', password: 'postgres')
    end
    
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['peep'] }
  end

  def self.post(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test', user: 'postgres', password: 'postgres')
    else 
      connection = PG.connect(dbname: 'chitter', user: 'postgres', password: 'postgres')
    end
    
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")

  end
end
