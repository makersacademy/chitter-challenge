require 'pg'

class Peeps

  attr_reader :messages

  def initialize
    @messages = []
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps')
    result.map { |peep| peep['peep'] }
  end

  def self.add(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}');")
  end

  def self.create
    @peeps = Peeps.new
  end

  def self.instance
    @peeps
  end
  
  def add(peep)
    @messages << peep
  end

end
