require 'pg'
class Peep
  def self.all
    connection = PG.connect(dbname: 'Peeps')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end

  def self.create(peep)
    connection = PG.connect(dbname: 'Peeps')
    connection.exec("INSERT INTO Peeps (peep) VALUES('#{peep}');")
  end
end
