require 'pg'
class Peep
        def self.all
            if ENV['ENVIRONMENT'] == 'test'
              connection = PG.connect(dbname: 'chitter_test')
            else
              connection = PG.connect(dbname: 'chitter')
            end
        
       result = connection.exec("SELECT * FROM my_peeps;")
        result.map { |peep| peep['peep'] }
    end
  end