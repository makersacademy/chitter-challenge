require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter')
    peeps = connection.exec('SELECT * FROM peeps;')
    peeps.map { |peep| peep['peep_text'] }
  end

end
