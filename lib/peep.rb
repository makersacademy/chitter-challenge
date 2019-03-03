require 'pg'

class Peep

  def self.all
    self.connect
    result = @connection.exec("SELECT * FROM peeps;")
    result.map { |entry| entry['peep'] }
  end

  def self.create(peep:)
    self.connect
    result = @connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}');")
  end

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end
