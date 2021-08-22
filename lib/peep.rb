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
      conn = PG.connect(dbname: 'chitter_test')
    else 
      conn = PG.connect(dbname: 'chitter')
    end 
    result = conn.exec ( "SELECT * FROM peeps;" )
    puts result
    result.map do |peep|  
      Peep.new( message: peep['message'], author: peep['author'], time: peep['time']) 
    end 
  end
end
