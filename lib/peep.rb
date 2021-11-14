require 'pg'


class Peep

  attr_reader :message, :time
  
  def initialize(message:, time:)
    
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC")
    result.map { |peep| Peep.new(message: peep['message'], time: peep['time']) }
    end


  def self.create(message:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
 
      connection.exec("INSERT INTO peeps (message, time) VALUES('#{message}', '#{time}');")
    end

end