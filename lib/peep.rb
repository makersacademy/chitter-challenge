require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_test')
    response = connection.exec('SELECT * FROM peeps;')
    response.map { |peep| peep['text'] }
  end
end