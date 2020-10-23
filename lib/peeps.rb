require 'pg'

class Peeps

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['peep'] }
     #[ 'Happy Friday!', 'Does chitter remind you of anything? Tweet Tweet']
  end
end