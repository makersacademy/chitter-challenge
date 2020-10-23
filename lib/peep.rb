require 'pg'

class Peep
  attr_reader :peeps

  def self.all
    connect
    @peeps.map { |peep| peep["peep"] }
  end

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test') 
    else
      connection = PG.connect(dbname: 'chitter')
    end
    @peeps = connection.exec("SELECT * FROM peeps;") 
  end

end
