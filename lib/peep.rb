require 'pg'

class Peep
  attr_reader :id, :peeps, :time

  def initialize(id:, peeps:, time:) 
    @id = id
    @peeps = peeps
    @time = time
  end 

  def self.all
     if ENV['RACK_ENV'] = 'test'
       connection = PG.connect(dbname: 'chitter_test')
     else
       connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec('SELECT * FROM peeps;')
      result.map do |peeps| 
      Peep.new(id: peeps['id'], peeps: peeps['peep'], time: peeps['time'])
  end 
end 
  
  def self.add(peep:)
    if ENV['RACK_ENV'] = 'test'
    connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{Time.new.strftime('%k:%M')}') RETURNING peep")
  end 


end 