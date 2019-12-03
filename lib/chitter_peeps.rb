require 'pg'

class Chitter_peeps
  attr_reader :peep

  def initialize(peep)
    @peep = peep
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    result = connection.exec("SELECT * FROM chitter")
    result.map {|peep| Chitter_peeps.new(peep['peeps'])}
  end


  def self.create(peep:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    connection.exec("INSERT INTO chitter (peeps) VALUES('#{peeps}')")
  end

end
