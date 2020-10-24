require 'pg'

class Peep

  if ENV['RACK_ENV'] == 'test'
    @connection = PG.connect(dbname: 'chitter_test')
  else
    @connection = PG.connect(dbname: 'chitter')
  end

  def self.all
    result = @connection.exec("SELECT * FROM peeps ORDER BY peeptime DESC;")
    result.map do |peep|
      peep = peep['peep']
    end
  end

  def self.create(peep:)
    result = @connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}');")
  end

end
