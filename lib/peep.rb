require 'pg'

class Peep
  def self.all
    if ENV['RACK_ENV'] = 'test'
      connection = PG.connect(dbname: 'chitter-test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end

  def self.create(peep:)
    if ENV['RACK_ENV'] = 'test'
      connection = PG.connect(dbname: 'chitter-test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}');")
  end
end
