require 'pg'
class Peep
  attr_reader :id, :username, :peep, :time 
  
  def initialize(id, username, peep, time)
    @id = id
    @username = username 
    @peep = peep 
    @time = time 
  end 

def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    result = connection.exec('SELECT * FROM peeps')
       result.map { |peep| Peep.new(peep['id'], peep['username'], peep['peep'], peep['time']) }
  end

def self.create(options)
  connection = if ENV['ENVIRONMENT'] == 'test'
                 PG.connect(dbname: 'chitter_test')
               else
                 PG.connect(dbname: 'chitter')
  end
  connection.exec("INSERT INTO bookmarks (url) VALUES ('#{options[:url]}')")
end
end 