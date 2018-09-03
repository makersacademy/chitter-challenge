require 'pg'

class Peep 

  attr_reader :text, :date, :time, :username

  def initialize(text, username, date, time)
    @text = text
    @username = username
    @date = date 
    @time = time
  end

  def self.all 
    connect_database
    @connection.exec("SELECT * FROM peeps;").map do |peep| 
      Peep.new(peep['text'], peep['username'], peep['date'], peep['time'])
    end
  end

  def self.add(peep, *username)
    connect_database
    @connection.exec("INSERT INTO peeps (text, username, time, date) 
                      VALUES('#{peep}', '#{username}', '#{time}', '#{date}');")
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
