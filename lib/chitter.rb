require 'pg'

class Chitter

  def self.all
    connection = PG.connect(dbname: 'chitter')
    peeps = connection.exec('SELECT * FROM chatter')
    peeps.map { |latest| latest['peep'] }
  end

  def self.add(peep)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO chatter (peep) VALUES('#{peep}')")
  end

end
