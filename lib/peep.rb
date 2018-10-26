require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager_2')
    end
    
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['message'] }
  end
end
