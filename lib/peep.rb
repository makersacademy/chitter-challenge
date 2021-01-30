require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'peep_manager')
    p result = connection.exec('SELECT * FROM peeps')
    p x=result.map { |peep| peep['peep'] }
  end
end