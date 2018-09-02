require 'pg'

class Peep 

  attr_reader :text, :date, :time

  def initialize(text, date, time)
    @text = text
    @date = date 
    @time = time
  end

  def self.all 
    connect_database
    @connection.exec("SELECT * FROM peeps;").map do |peep| 
      Peep.new(peep['text'], peep['date'], peep['time'])
    end
  end

  def self.add(peep)
    connect_database
    @connection.exec("INSERT INTO peeps (text, time, date) 
                      VALUES('#{peep}', '#{time}', '#{date}');")
  end

  private_class_method def self.connect_database
    ENV['ENV'] == 'test' ? database = 'chitter_test' : database = 'chitter'
    @connection = PG.connect(dbname: database)
  end

  private_class_method def self.date
    Time.now.strftime("%m/%d/%Y")
  end

  private_class_method def self.time
    Time.now.strftime("%H:%M%p")
  end

end
