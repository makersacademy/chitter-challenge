require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['content'] }
  end
end