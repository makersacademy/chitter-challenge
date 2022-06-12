require 'pg'
class Peeps 
  def self.all
    conn = PG.connect(dbname: 'chitter')
    result = conn.exec_params("SELECT * FROM peeps;")
    result.map do 
      |peep| peep['message']
    end 
  end 
end 
