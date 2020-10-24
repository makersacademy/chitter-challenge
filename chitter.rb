require 'pg'

class Chitter 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end
    retrieve_all = con.exec "SELECT * FROM peeps"
    retrieve_all.map do |row|
      row['message']
    end
  end

  def self.add(peep)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end

   @peep = con.exec("INSERT INTO peeps (message) VALUES('#{peep}')")
   @peep
  end

end