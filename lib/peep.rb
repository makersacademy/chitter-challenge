require 'pg'

class Peep

  attr_reader :message, :author, :time

  def initialize(message, author, time)
    @message = message
    @author = author
    @time = time
  end

  def self.create(message, author)
    time = Time.now
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
    @connection.exec( "INSERT INTO peeps(message, author, time) 
    VALUES('#{message}', '#{author}', '#{time}') 
    RETURNING id, message, author, time;" )
    @peep = Peep.new(message, author, time)
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
    result = @connection.exec("SELECT * FROM peeps;")
    result.map do |peep|  
      Peep.new(peep['message'], peep['author'], peep['time']) 
    end 
  end
end
