require 'pg'

class Peep
  
  def self.all 
   connection = 
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'chitter_test')
      else
        PG.connect(dbname: 'chitter')
      end
   result = connection.exec("SELECT * FROM peeps;")
   result.map { |peep| peep['message_body']}
  end 

  def self.create(peep_body:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    connection.exec("INSERT INTO peeps (message_body) VALUES('#{peep_body}')")
    
  end 

end