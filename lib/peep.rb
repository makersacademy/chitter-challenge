require 'pg'

class Peep 
  def self.read
    connection = PG.connect(dbname: 'chitter_challenge')
    result = connection.exec('SELECT * FROM chitter;')
    result.map { |peeps| peeps['peeps'] }
  
  end 
end 





  # [
    #   "Peep 1", 
    #   "Peep 2", 
    #   "Peep 3" 
    # ]