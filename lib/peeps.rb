require 'pg'

class Peeps 
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else 
      conn = PG.connect(dbname: 'chitter')
    end 
    
    result = conn.exec_params("SELECT * FROM peeps;")
    result.map do 
      |peep| peep['message']
    end 
  end 
end 
