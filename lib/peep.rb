require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: environment)
    result = connection.exec('SELECT * FROM peeps;')

    result.map { |peep| peep['peep'] }
  end

  def self.add(peep)
    connection = PG.connect(dbname: environment)
    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end


  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
  end
end