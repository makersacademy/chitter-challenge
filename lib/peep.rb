require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end

    result = connection.exec('SELECT * FROM peeps ORDER BY peep DESC')
    result.map { |peep| peep['peep'] }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep")
  end
end
