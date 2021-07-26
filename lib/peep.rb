require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connection(dbname: 'peep_manager')
    end
    
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['peep'] }
  end
end
