require 'pg'
class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps_data")
    result.map { |peep| peep['peep'] }
  end

  def self.create(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    connection.exec("INSERT INTO peeps_data (peep) VALUES('#{peep}')")
  end
end