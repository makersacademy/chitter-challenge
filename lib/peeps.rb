require 'pg'

class Peeps

  def initialize

  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec('SELECT * FROM peeps
      ORDER BY posted_at DESC;')
    result.map { |peep| peep['peep'] }
  end

  def self.add(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING peep, posted_at")
  end
end