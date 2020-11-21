require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_challenge')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['script'] }
  end
end
