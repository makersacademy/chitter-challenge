require 'pg'

class Peeps
  
  attr_reader :id, :peep, :time, :users

  def initialize(id:, peep:, time:)
    @id = id 
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
    result = con.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peeps.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
  end

  def self.create
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    result = con.exec("INSERT INTO peeps(peep,time) VALUES ('#{peep}', '#{time}' RETURNING id, peep, time;")
    Peeps.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

end
