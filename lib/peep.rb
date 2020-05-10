require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'Chitter_Manager')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end
end
