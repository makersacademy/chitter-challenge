require 'pg'

class Peep 
  def self.read
    # connection = PG.connect(dbname: 'chitter_challenge')
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_challenge_test')
        else
          connection = PG.connect(dbname: 'chitter_challenge')
        end
        
        result = connection.exec('SELECT * FROM chitter;')
        result.map { |peeps| peeps['peeps'] }
  
  end 
end 


