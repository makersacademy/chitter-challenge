require 'pg'

class Peeps 

  def self.all
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end

  def self.post(peep)
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}')")
  end 

end 