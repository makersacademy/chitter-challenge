require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "Chitter_Test")
    else
      connection = PG.connect(dbname: "Chitter")
    end

    peeps = connection.exec("SELECT * FROM peep ORDER BY timestamp DESC;")
    peeps.map { |peep| peep['peep'] }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "Chitter_Test")
    else
      connection = PG.connect(dbname: "Chitter")
    end

    connection.exec("INSERT INTO peep (peep) VALUES('#{peep}');")
  end
end
