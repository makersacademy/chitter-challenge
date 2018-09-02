require 'pg'

class Peep 

  def self.all 
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['text'] }
  end

  def self.add(peep)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (text) VALUES('#{peep}')")
  end

end
