require 'pg'

class Peep
  
  attr_reader :id, :peep
  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    connect_db
    result = @connection.exec('SELECT * FROM peeps;')
    result.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'])
    end
  end

  def self.add(peep:)
    connect_db
    @connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
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
