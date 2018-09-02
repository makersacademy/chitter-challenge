require 'pg'

class Peep 

  def self.all 
    connect_database
    @connection.exec("SELECT * FROM peeps;").map { |peep| peep['text'] }
  end
    
  def self.add(peep)
    connect_database
    @connection.exec("INSERT INTO peeps (text) VALUES('#{peep}')")
  end

  def self.connect_database
    ENV['ENV'] == 'test' ? database = 'chitter' : database = 'chitter'
    @connection = PG.connect(dbname: database)
  end

end
