require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |entry| entry['peep'] }
  end

  def self.create(peep:)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}');")
  end

end
