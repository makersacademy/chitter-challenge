require 'pg'

class Peeps
  
  def self.all
    connect_db
    result = @connection.exec('SELECT * FROM peeps')
    result.map { |peep| peep['peep'] }
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
