require 'pg'

class Peep
  def self.feed
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM chitter;")
    result.map { |peep| peep['peep'] }
  end

  def self.create(peep:)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}')")
  end
end
