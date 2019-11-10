require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_board')
    peeps = connection.exec('SELECT * FROM peeps;')
    peeps.map { |peep| peep['title'] }
  end
end
