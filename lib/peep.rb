require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_Manager_test')
    else
      connection = PG.connect(dbname: 'Chitter_Manager')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }.reverse
  end
end
