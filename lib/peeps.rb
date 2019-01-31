require 'pg'

class Peep
  
  attr_reader :id, :peep, :date
  def initialize(id:, peep:, date:)
    @id = id
    @peep = peep
    @date = date
  end

  def self.all
    connect_db
    result = @connection.exec('SELECT * FROM peeps;')
    result.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], date: peep['date'])
    end
  end

  def self.add(peep:)
    connect_db
    result = @connection.exec("INSERT INTO peeps (peep, date) VALUES('#{peep}', '#{DateTime.now.strftime("%c")}') RETURNING id, peep, date;")
    Peep.new(id: result.first['id'], peep: result.first['peep'], date: result.first['date'])
  end

  private

  def self.connect_db
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect :dbname => 'Chitter_Manager_Test'
    else
      @connection = PG.connect :dbname => 'Chitter_Manager'
    end
    
  end

end
