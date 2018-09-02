require 'pg'

class Peep 

  def self.all 
    connect_database
    @connection.exec("SELECT * FROM peeps;").map { |peep| 
      peep['text'] + ' ' + peep['date']  + ' ' + peep['time']}.reverse
  end
    
  def self.add(peep)
    connect_database
    @connection.exec("INSERT INTO peeps (text, time, date) VALUES('#{peep}', '#{time}', '#{date}');")
  end

  private
  def self.connect_database
    ENV['ENV'] == 'test' ? database = 'chitter_test' : database = 'chitter'
    @connection = PG.connect(dbname: database)
  end

  def self.date
    Time.now.strftime("%m/%d/%Y")
  end

  def self.time
    Time.now.strftime("%H:%M%p")
  end

end
