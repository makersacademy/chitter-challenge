require 'pg'

class Peep

  def self.all
    connection = PG.connect(dbname: 'chitter_manager_test')
    result = connection.exec('SELECT * FROM peeps;')
    p result
    result.map { |peeps| peeps['peep'] }
  end
end
