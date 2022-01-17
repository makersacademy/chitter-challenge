require 'pg'

class Peep
  def self.create(peep)
    time = Time.now
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec_params("INSERT INTO peeps(peep, peeped_at, nanosecs) VALUES ($1, $2, $3);", [peep, time, time.nsec])
  end

  def self.show
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec("SELECT * FROM peeps ORDER BY peeped_at DESC, nanosecs DESC;")
    peeps.map { |peep| peep['peep'] }
  end
end