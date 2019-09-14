require 'pg'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
     connection = PG.connect(dbname: 'peep_manager_test')
    else
    connection = PG.connect(dbname: 'Peep_Manager')
  end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end
end
