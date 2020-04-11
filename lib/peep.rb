require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_peeps')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peeps| peeps['peep'] }
  end

  def peep_time
    Time.now
  end
end
