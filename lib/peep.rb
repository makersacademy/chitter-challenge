require 'pg'

class Peep 
  
  attr_reader :id, :peep, :time_date

  def initialize(id:, peep:, time_date:)
    @id = id
    @peep = peep
    @time_date = time_date
  end

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], time_date: peep['created_at']) 
    end  
  end

  def time
    time = Time.parse(@time_date.to_s)
    time.strftime("%Y-%m-%d %I:%M %p")
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep, created_at;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time_date: result[0]['created_at'])
  end
end
